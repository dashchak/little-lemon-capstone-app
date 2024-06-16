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
    @State private var isLoggedIn: Bool = false

    var body: some View {
        Group {
            if isLoggedIn {
                MainView()
            } else {
                OnboardingView(onRegisterSuccess: {
                    isLoggedIn = true
                })
            }
        }
        .onAppear {
            checkLoginStatus()
        }
    }

    private func checkLoginStatus() {
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
}
