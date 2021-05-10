//
//  UserTables.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 5/8/21.
//

import Foundation
import SQLite

class UserTables {
    
    // SQLite instance
    private var db : Connection!
    
    // create table instance
    private var broNotes: Table!
    
    // table columns
    private var id : Expression<Int64>!
    private var title: Expression<String>!
    private var eventDescription: Expression<String>!
    private var eventTime: Expression<Int64>!
    
    // constructor
    init() {
        
        do {
            // directory path
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            
            // create database connection
            db = try Connection("\(path)/my_users.sqlite3")
            
            // create table object
            broNotes = Table("broNotes")
            
            // column instances
            id = Expression<Int64>("id")
            title = Expression<String>("Title")
            eventDescription = Expression<String>("Description")
            eventTime = Expression<Int64>("EventTime")
            
            // check for existing tables
            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
                // creates table
                try db.run(broNotes.create { (t) in
                    t.column(id, primaryKey: true)
                    t.column(title)
                    t.column(eventDescription, unique: true)
                    t.column(eventTime)
                })
                // table exists, do not create a new one
                UserDefaults.standard.set(true, forKey:"is_db_created")
            }
        } catch {
            // display errors
            print(error.localizedDescription)
        }
    }
    
    // add row to table
    public func addEvent(titleValue: String, eventDescriptionValue: String, eventTimeValue: Int64) {
        do {
            try db.run(broNotes.insert(title <- titleValue, eventDescription <- eventDescriptionValue , eventTime <- eventTimeValue))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func getEntries() -> [SavedNotes] {
        // create empty array
        var savedNotes: [SavedNotes] = []
        
        // descending order of entries
        broNotes = broNotes.order(id.desc)
        
        // exceptions
        do {
            // loop through all entries
            for broNotes in try db.prepare(broNotes) {
                // creates new model in each loop iteration
                let savedModel: SavedNotes = SavedNotes()
                
                // set values in model from db
                savedModel.id = broNotes[id]
                savedModel.title = broNotes[title]
                savedModel.eventDescription = broNotes[eventDescription]
                savedModel.eventTime = broNotes[eventTime]
                
                // append in array
                savedNotes.append(savedModel)
            }
        } catch {
            print(error.localizedDescription)
        }
        return savedNotes
        
    }
    
    // get individual table entry
    public func getEntry(idValue: Int64) -> SavedNotes {
        
        // create empty object
        let savedModel: SavedNotes = SavedNotes()
        
        // exception handling
        do {
            // get entry id
            let broNote: AnySequence<Row> = try db.prepare(broNotes.filter(id == idValue))
            
            // get row
            try broNote.forEach({ (rowValue) in
                // set values
                savedModel.id = try rowValue.get(id)
                savedModel.title = try rowValue.get(title)
                savedModel.eventDescription = try rowValue.get(eventDescription)
                savedModel.eventTime = try rowValue.get(eventTime)
            })
        } catch {
            print(error.localizedDescription)
        }
        return savedModel
    }
    
    public func updateEntry(idValue: Int64, titleValue: String, eventDescriptionValue: String, eventTimeValue: Int64) {
        do {
            // find entry by id
            let broNote: Table = broNotes.filter(id == idValue)
            
            try db.run(broNote.update(title <- titleValue, eventDescription <- eventDescriptionValue, eventTime <- eventTimeValue))
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func deleteUser(idValue: Int64) {
        do {
            let broNote: Table = broNotes.filter(id == idValue)
            
            // run delete query
            try db.run(broNote.delete())
        } catch {
            print(error.localizedDescription)
        }
    }
}


