//
//  CalendarEvents.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//

import SwiftUI

struct EventInfo : Identifiable {
    
    var id = UUID()
    var eventTitle : String
    var eDescription : String
    
}

struct DateType {
    var Day: String
    var Date: String
    var Year: String
    var Month: String
}

struct CalendarEvents: View {
    
    // create list to hold events
    var events = [EventInfo]()

    var body: some View {
        NavigationView {
            VStack {
                Image("calendar")
                    .resizable()
                    .padding()
                    .frame(minWidth: 10, idealWidth: 150, maxWidth: 20, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 10, maxHeight: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Here are your upcoming events.")
                
                Spacer()
                
                List(events) { events in
                    NavigationLink(destination: UserEvents(events: events)) {
                        Text(events.eDescription)
                            .padding()
                    }
                }
                
                Spacer()
                
                List {
                    NavigationLink(destination: AddEvent()) {
                        Text("Add Event")
                    }
                }
                
            }
        }
    }
}

var events = [
    EventInfo(eventTitle: "Event 1", eDescription: "Event 1 Description")
]

struct UserEvents : View {
    var events : EventInfo
    
    var body : some View {
        VStack {
            ZStack {
                Text(events.eDescription)
            }
        }
    }
}

struct CalendarEvents_Previews: PreviewProvider {
    static var previews: some View {
        CalendarEvents()
    }
}
