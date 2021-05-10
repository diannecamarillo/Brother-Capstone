//
//  Notifications.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//


import Foundation
import SwiftUI
import UserNotifications

struct Notifications: View {
    
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("Notifications are now turned on.")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "First Notification"
                content.subtitle = "Notification Subtitle"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }

}

struct NotificationPreview: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
