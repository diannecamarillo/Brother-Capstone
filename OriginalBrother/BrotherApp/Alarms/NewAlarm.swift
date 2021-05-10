//
//  NewAlarm.swift
//  BrotherApp
//
//  Created by Carlos Monroy on 3/24/21.
//

import Foundation
import SwiftUI

struct NewAlarm: View {
    
    @State private var title = ""
    @State private var time = ""
    
    var body: some View {
        VStack {
            Text("New Alarm")
            Spacer()
            Form {
                Section {
                    TextField("Title", text: $title)
                }
                Section {
                    TextField("Description", text: $time)
                }
            }
        }
    }
}

struct NewAlarm_Previews: PreviewProvider {
    static var previews: some View {
        NewAlarm()
    }
}
/*
class AlarmManager: ObservableObject {
    var timerMode: Timer = .initial
    
    var timer = Timer()
    
    func start() {
        timerMode = .running
        timer = Timer.
    }
}
*/
