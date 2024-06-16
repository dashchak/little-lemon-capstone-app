//
//  UserSession.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import SwiftUI
import Combine

class UserSession: ObservableObject {
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")

    func updateLoginStatus(_ isLoggedIn: Bool) {
        self.isLoggedIn = isLoggedIn
        UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
    }
}
