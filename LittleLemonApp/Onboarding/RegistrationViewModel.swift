//
//  RegistrationViewModel.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//


import SwiftUI
import Combine

class RegistrationViewModel: ObservableObject {
    @Published var isFormValid = false
    @Published var showRegistrationError: Bool = false
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""


    init () {
        setupBindings()
    }

    private func setupBindings() {
        Publishers.CombineLatest3($firstName, $lastName, $email)
            .map { [unowned self] firstName, lastName, email in
                !firstName.isEmpty && !lastName.isEmpty && isValid(email)
            }
            .assign(to: &$isFormValid)
    }

    private func isValid(_ email: String) -> Bool {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\.[A-Z]{2,64}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }

    func registerUser() {
        if isFormValid {
            showRegistrationError = false
            UserDefaultsService.shared.isLoggedIn = true
            UserDefaultsService.shared.user = User(firstName: firstName,
                                                   lastName: lastName,
                                                   email: email)
        } else {
            showRegistrationError = true
        }
    }
}
