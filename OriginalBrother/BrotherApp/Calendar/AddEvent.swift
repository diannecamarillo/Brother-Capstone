//
//  AddEvent.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//


import SwiftUI

struct AddEvent: View {
    
    @State private var title = ""
    @State private var time = ""
    
    var body: some View {
        VStack {
            Text("Add Event")
            Spacer()
            Form {
                Section {
                    TextField("Event title", text: $title)
                }
                Section {
                    TextField("Set time", text: $time)
                        .keyboardType(.numberPad)
                }
            }
        }
    }
}

struct AddEvent_Previews: PreviewProvider {
    static var previews: some View {
        AddEvent()
    }
}
