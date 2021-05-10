//
//  NewNote.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//

/*
 To Do
 - make form for user to create note
 - save to core data
 */

import SwiftUI

struct NewNote: View {
    
    @State private var Note = ""
    @State private var description = ""
    var body: some View {
        VStack {
            Text("New Note")
            Spacer()
            Form {
                Section {
                    TextField("Note Title", text: $Note)
                }
                Section {
                    TextField("Description", text: $description)
                }
            }
            NavigationLink(destination: Notes()) {
                Text("Save Note")
            }
        }
    }
}

struct DeleteNote : View {
    var body : some View {
        Text("Delete note")
    }
}

struct NewNote_Previews: PreviewProvider {
    static var previews: some View {
        NewNote()
    }
}
