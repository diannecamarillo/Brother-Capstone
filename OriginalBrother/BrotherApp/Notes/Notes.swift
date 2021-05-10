//
//  Notes.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//

import SwiftUI

struct NoteInfo: Identifiable {
    var id = UUID().uuidString
    var noteTitle: String
    var notesDescription: String
}

struct Notes: View {
    
    //let db = DBHelper()
    /*
    var notes = [NoteInfo]()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("notes")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom)
                Spacer()
                Text("Here are your notes.")
                Spacer()
                
                List(notes) { notes in
                    NavigationLink(destination: UserNotes(notes: notes)) {
                        Text(notes.notesDescription)
                    }
                }
                
                
 
                
                Spacer()
                List {
                    NavigationLink(destination: NewNote()) {
                        Text("New Note")
                    }
                }
                
            }
        }
    }
 */
   
        // array of entries
        @State var savedNotes: [SavedNotes] = []
        // check if user is selected for editing
        @State var entrySelected: Bool = false
        
        // entry id for editing
        @State var selectedEntryId: Int64 = 0
        
        var body: some View {
            NavigationView {
                VStack {
                    
                    // link to add entry
                    HStack {
                        Spacer()
                        NavigationLink(destination: AddEntryView(), label: {
                            Text("Add entry")
                        })
                    }
                        
                    NavigationLink(destination:
                                    EditUserView(id: self.$selectedEntryId), isActive: self.$entrySelected) {
                        EmptyView()
                    }
                    
                    List (self.savedNotes) { (model) in
                        HStack {
                            Text(model.title)
                            Spacer()
                            Text(model.eventDescription)
                            Spacer()
                            Text("\(model.eventTime)")
                            Spacer()
                            
                            // edit and delete button
                            Button(action: {
                                self.selectedEntryId = model.id
                                self.entrySelected = true
                            }, label: {
                                Text("Edit")
                            })
                            
                            Button(action: {
                                // create table instance
                                let brotherTable: UserTables = UserTables()
                                
                                // call delete function
                                brotherTable.deleteUser(idValue: model.id)
                                
                                // refresh array
                                self.savedNotes = brotherTable.getEntries()
                            }, label: {
                                Text("Delete")
                            })
                        }
                    }
                }
            }
        }
    
}

var notes = [
    NoteInfo(noteTitle: "Note 1", notesDescription: "Note 1 Description"),
    NoteInfo(noteTitle: "Note 2", notesDescription: "Note 2 Description")
]

struct UserNotes : View {
    var notes: NoteInfo
    var body: some View {
        VStack {
            ZStack {
                Text(notes.notesDescription)
            }
        }
    }
}

struct Notes_Previews: PreviewProvider {
    static var previews: some View {
        Notes()
    }
}
