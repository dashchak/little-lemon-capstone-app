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
    @StateObject private var userSession = UserSession()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userSession)
        }
    }
}
