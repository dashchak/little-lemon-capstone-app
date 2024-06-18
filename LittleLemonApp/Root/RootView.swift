//
//  RootView.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation
import SwiftUI

struct RootView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var userDefaultsService = UserDefaultsService.shared

    var body: some View {
        Group {
            if userDefaultsService.isLoggedIn {
                MainView()
            } else {
                OnboardingContainerView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
