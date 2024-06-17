//
//  UserDefaultsService.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 17.06.2024.
//

import Foundation
import Combine

enum UserDefaultsKeys: String {
    case userFirstName
    case userLastName
    case userEmail
    case isLoggedIn
}


class UserDefaultsService: ObservableObject {
    static let shared = UserDefaultsService()

    @Published var isLoggedIn: Bool {
         didSet {
             UserDefaults.standard.set(isLoggedIn, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
         }
     }

     private init() {
         self.isLoggedIn = UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
     }
     
    // General setter and getter
    private func set<T>(value: T, forKey key: UserDefaultsKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }

    private func get<T>(forKey key: UserDefaultsKeys) -> T? {
        return UserDefaults.standard.object(forKey: key.rawValue) as? T
    }

    private func remove(forKey key: UserDefaultsKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }

    // Specific setters and getters for userFirstName
    var userFirstName: String? {
        get {
            return get(forKey: .userFirstName)
        }
        set {
            set(value: newValue, forKey: .userFirstName)
        }
    }

    // Specific setters and getters for userLastName
    var userLastName: String? {
        get {
            return get(forKey: .userLastName)
        }
        set {
            set(value: newValue, forKey: .userLastName)
        }
    }

    // Specific setters and getters for userEmail
    var userEmail: String? {
        get {
            return get(forKey: .userEmail)
        }
        set {
            set(value: newValue, forKey: .userEmail)
        }
    }

    // Method to clear data for testing purposes
    func clearData() {
        remove(forKey: .userFirstName)
        remove(forKey: .userLastName)
        remove(forKey: .userEmail)
        isLoggedIn = false
        remove(forKey: .isLoggedIn)
    }
}

