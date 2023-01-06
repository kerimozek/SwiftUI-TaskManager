//
//  SwiftUI_TaskManagerApp.swift
//  SwiftUI-TaskManager
//
//  Created by Mehmet Kerim ÖZEK on 1.01.2023.
//

import SwiftUI

@main
struct Task_ManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
