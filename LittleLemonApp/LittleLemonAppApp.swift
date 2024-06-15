//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 15.06.2024.
//

import SwiftUI

@main
struct LittleLemonAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
