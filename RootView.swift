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
                OnboardingView()
            }
        }
    }
}
