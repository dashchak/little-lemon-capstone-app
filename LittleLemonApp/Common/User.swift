//
//  User.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 18.06.2024.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    @Published var firstName: String
    @Published var lastName: String
    @Published var email: String
    @Published var phoneNumber: String
    @Published var orderStatuses: Bool
    @Published var passwordChanges: Bool
    @Published var specialOffers: Bool
    @Published var newsletter: Bool

    init(firstName: String = "",
         lastName: String = "",
         email: String = "",
         phoneNumber: String = "",
         orderStatuses: Bool = false,
         passwordChanges: Bool = false,
         specialOffers: Bool = false,
         newsletter: Bool = false) {

        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.orderStatuses = orderStatuses
        self.passwordChanges = passwordChanges
        self.specialOffers = specialOffers
        self.newsletter = newsletter
    }
}
