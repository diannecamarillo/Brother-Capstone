//
//  BrotherAppApp.swift
//  BrotherApp
//
//  Created by Dianne Camarillo on 3/22/21.
//

import SwiftUI
import UIKit

@main
struct BrotherAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
    }
}

// initialize container for Core Data
/*class PersistenceManager {
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyApplication")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    init() {
        let center = NotificationCenter.default
        let notification = UIApplication.willResignActiveNotification
        
        center.addObserver(forName: notification, object: nil, queue: nil) { [weak self] _ in
            guard let self = self else { return }
            
            if self.persistentContainer.viewContext.hasChanges {
                try? self.persistentContainer.viewContext.save()
            }
        }
    }
}
*/
