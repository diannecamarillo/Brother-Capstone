//
//  UserSettings.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//

/*
 To Do
 - light/dark mode
 */

import SwiftUI

struct UserSettings: View {
    
    var username: String
    
    var body: some View {
        NavigationView {
            List {
                Text("Change username")
                Text("Change theme")
            }
            
        }.navigationTitle("User Settings")
    }
}

struct UserSettings_Previews: PreviewProvider {
    static var previews: some View {
        UserSettings(username: "Yan")
    }
}
