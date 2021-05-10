//
//  DBHelper.swift
//  BrotherApp
//
//  Created by Carlos Monroy on 4/16/21.
//

/*
import Foundation
import SQLite3

class DBHelper {
    
    var db : OpaquePointer?
    var path: String = "notes.sqlite"
    init() {
        self.db = createdb()
        self.createTable()
    }
    
    func createdb() -> OpaquePointer {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
        
        var db: OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            print("Error occured when creating Notes Database")
        } else {
            print("Notes Database has been created with path \(path)")
            return db
        }
    }
    
    func createTable() {
        let query = " CREATE TABLE IF NOT EXISTS grade(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, result TEXT, list TEXT);"
        let createTable: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &createTable, nil) == SQLITE_OK {
            if sqlite3_step(createTable) == SQLITE_DONE {
                print("Note table creation success.")
            } else {
                print("Note Table creation failed.")
            } else {
                print("Preparation fail.")
            }
        }
    }
}
*/
