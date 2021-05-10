//
//  EditUserTable.swift
//  BrotherApp
//
//  Created by Carlos Monroy on 5/8/21.
//

import Foundation
import SwiftUI

struct EditUserView : View {
    
    // id from previous view
    @Binding var id: Int64
    
    // input variables
    @State var title: String = ""
    @State var eventDescription: String = ""
    @State var eventTime: String = ""
    
    // return to preview VC
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            TextField("Event name", text: $title)
            TextField("Description", text: $eventDescription)
            TextField("Event time", text: $eventTime)
            
            // button to update event
            Button(action: {
                
                // call function to update row in SQLite database
                UserTables().updateEntry(idValue: self.id, titleValue: self.title, eventDescriptionValue: self.eventDescription, eventTimeValue: Int64(self.eventTime) ?? 0 )
                
                // return to home page
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Edit entry")
            })
            
            // populate user data
            .onAppear(perform: {
                // fetch data from db
                let savedModel: SavedNotes = UserTables().getEntry(idValue: self.id)
                // populate text fields
                self.title = savedModel.title
                self.eventDescription = savedModel.eventDescription
                self.eventTime = String(savedModel.eventTime)
            })
        
        }
    }
}

struct EditUserView_Previews: PreviewProvider {
    @State static var id: Int64 = 0
    static var previews: some View {
        EditUserView(id: $id)
    }
}
