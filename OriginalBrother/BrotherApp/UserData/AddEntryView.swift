//
//  AddEntryView.swift
//  BrotherApp
//
//  Created by Carlos Monroy on 5/9/21.
//

import Foundation
import SwiftUI

struct AddEntryView: View {
    
    // creates variables to store user input
    @State var title: String = ""
    @State var eventDescription = ""
    @State var eventTime = ""
    
    // back to previous screen after adding entry
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            TextField("Enter Title", text: $title)
            TextField("Event Description", text: $eventDescription)
            TextField("Event Time", text: $eventTime)
            
            Button(action: {
                UserTables().addEvent(titleValue: self.title, eventDescriptionValue: self.eventDescription, eventTimeValue: Int64(self.eventTime) ?? 0)
            }, label: {
                Text("Add entry")
            })
        }
    }
}
