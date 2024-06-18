//
//  UserDefaultsService.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 17.06.2024.
//

import Foundation

class UserDefaultsService: ObservableObject {
    static let shared = UserDefaultsService()

    @Published var isLoggedIn: Bool {
        didSet {
            userDefaults.set(isLoggedIn, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        }
    }
    private let userDefaults = UserDefaults.standard

    init() {
        self.isLoggedIn = userDefaults.bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

    var user: User {
        get {
            return User(
                firstName: userDefaults.string(forKey: UserDefaultsKeys.userFirstName.rawValue) ?? "",
                lastName: userDefaults.string(forKey: UserDefaultsKeys.userLastName.rawValue) ?? "",
                email: userDefaults.string(forKey: UserDefaultsKeys.userEmail.rawValue) ?? "",
                phoneNumber: userDefaults.string(forKey: UserDefaultsKeys.phoneNumber.rawValue) ?? "",
                orderStatuses: userDefaults.bool(forKey: UserDefaultsKeys.orderStatuses.rawValue),
                passwordChanges: userDefaults.bool(forKey: UserDefaultsKeys.passwordChanges.rawValue),
                specialOffers: userDefaults.bool(forKey: UserDefaultsKeys.specialOffers.rawValue),
                newsletter: userDefaults.bool(forKey: UserDefaultsKeys.newsletter.rawValue)
            )
        }
        set {
            userDefaults.set(newValue.firstName, forKey: UserDefaultsKeys.userFirstName.rawValue)
            userDefaults.set(newValue.lastName, forKey: UserDefaultsKeys.userLastName.rawValue)
            userDefaults.set(newValue.email, forKey: UserDefaultsKeys.userEmail.rawValue)
            userDefaults.set(newValue.phoneNumber, forKey: UserDefaultsKeys.phoneNumber.rawValue)
            userDefaults.set(newValue.orderStatuses, forKey: UserDefaultsKeys.orderStatuses.rawValue)
            userDefaults.set(newValue.passwordChanges, forKey: UserDefaultsKeys.passwordChanges.rawValue)
            userDefaults.set(newValue.specialOffers, forKey: UserDefaultsKeys.specialOffers.rawValue)
            userDefaults.set(newValue.newsletter, forKey: UserDefaultsKeys.newsletter.rawValue)
        }
    }

    func clearUserData() {
        userDefaults.removeObject(forKey: UserDefaultsKeys.userFirstName.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKeys.userLastName.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKeys.userEmail.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKeys.phoneNumber.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKeys.orderStatuses.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKeys.passwordChanges.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKeys.specialOffers.rawValue)
        userDefaults.removeObject(forKey: UserDefaultsKeys.newsletter.rawValue)
        isLoggedIn = false
        userDefaults.removeObject(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
}


extension UserDefaultsService {
    private enum UserDefaultsKeys: String {
        case userFirstName
        case userLastName
        case userEmail
        case phoneNumber
        case orderStatuses
        case passwordChanges
        case specialOffers
        case newsletter
        case isLoggedIn
    }
}
