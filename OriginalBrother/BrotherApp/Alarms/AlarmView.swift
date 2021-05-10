//
//  AlarmView.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//

import SwiftUI
import UIKit

struct AlarmInfo: Identifiable {
    var id = UUID()
    var alarmTitle: String
    var alarmTime: String
}

struct AlarmView: View {

    // monitors current date and time
    @State var date = Date()

    var alarms = [AlarmInfo]()
    
    var body: some View {
        NavigationView {
            VStack {
               /* Text("It is : \(timeString(date: date))")
                    .padding()
                    .onAppear(perform: {
                        let _ = self.updateTime
                    }) */
                Spacer()
                List(alarms) { alarms in
                    NavigationLink(destination: UserAlarms(alarms: alarms)) {
                        Text(alarms.alarmTime)
                    }
                }
            }
            
        }
    }
    /*
    // format date and time
    var timeFormat: DateFormatter {
        let format = DateFormatter()
        format.dateFormat = "hh:mm:ss a"
        return format
    }
    
    // string for displaying time
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    
    // keep time updated
    var updateTime: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in 
            self.date = Date()
        })
    }
 */
}

struct UserAlarms : View {
    var alarms: AlarmInfo
    var body: some View {
        VStack {
            ZStack {
                Text(alarms.alarmTime)
            }
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}

enum Timer {
    case running
    case pause
    case initial
}
