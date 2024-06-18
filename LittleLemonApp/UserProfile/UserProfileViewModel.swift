//
//  UserProfileViewModel.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 18.06.2024.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var errorMessage: String = ""
    @Published var errorMessageShow: Bool = false

    let shared = UserDefaultsService.shared
    
    init() {
        let defaultsUser = UserDefaultsService.shared.user
        self.user = User(
            firstName: defaultsUser.firstName,
            lastName: defaultsUser.lastName,
            email: defaultsUser.email,
            phoneNumber: defaultsUser.phoneNumber,
            orderStatuses: defaultsUser.orderStatuses,
            passwordChanges: defaultsUser.passwordChanges,
            specialOffers: defaultsUser.specialOffers,
            newsletter: defaultsUser.newsletter
        )
    }

    func validateUserInputs() -> Bool {
        if user.firstName.isEmpty ||
            user.lastName.isEmpty ||
            user.email.isEmpty ||
            user.phoneNumber.isEmpty {

            errorMessage = "Please fill in all fields."
            errorMessageShow = true
            return false
        }

        return true
    }

    func discardChanges() {
        user = shared.user
    }

    func saveChanges() {
        shared.user = user
    }

    func obtainData() {
        user = shared.user
    }
}

