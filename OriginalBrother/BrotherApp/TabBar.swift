//
//  TotalView.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//

import SwiftUI

// switch between the three main tabs
struct TabBar: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem() {
                    Label("Home", systemImage: "house")
                }
            Day()
                .tabItem() {
                    Label("Planner", systemImage: "square.and.pencil")
                }
            ContentView()
                .tabItem() {
                    Label("Settings", systemImage: "list.dash")
                }
        }
    }
}

// displays schedule for the day
struct Day: View {
    var body: some View {
        VStack {
            Text("Hello, Yan.")
                .font(.title)
                .padding(.top)
            Spacer()
            Section(header: Text("Todays events: ").font(.title)) {
                ForEach(events){ events in
                    Text(events.eventTitle)
                        .font(.title2)
                    Text(events.eDescription)
                }
            }
            Spacer()
            Section(header: Text("Notes: ").font(.title)) {
                ForEach(notes){ notes in
                    Text(notes.noteTitle)
                        .font(.title2)
                    Text(notes.notesDescription)
                }
            }
            Spacer()
            Text("Todays weather: ").font(.title)
                .padding()
            Spacer()
        }
    }
}

// SQLite Table
/*
struct Day: View {
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
*/
struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
