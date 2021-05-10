//
//  ContentView.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//

import SwiftUI

struct ContentView: View {
    
    // display different view controllers that the user can select to edit
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink(destination: CalendarEvents()) {
                    Text("Calendar")
                }
                NavigationLink(destination: Notes()) {
                    Text("Notes")
                }
                NavigationLink(destination: AlarmView()) {
                    Text("Alarms")
                }
                NavigationLink(destination: Weather()) {
                    Text("Weather")
                }
                NavigationLink(destination: PersonalSchedule()) {
                    Text("Personal Schedule")
                }
                NavigationLink(destination: UserSettings(username: "Yan")) {
                    Text("Brother Settings")
                }
                NavigationLink(destination: Notifications()) {
                    Text("Notifications")
                }
                NavigationLink(destination: AddEntryView()) {
                    Text("Saved Entries")
                }
                
            }.navigationTitle("Bröther")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
