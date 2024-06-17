//
//  OnboardingViewModel.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var isFormValid = false
    @Published var showRegistrationError: Bool = false
    
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""


    init () {
        setubBindings()
    }

    private func setubBindings() {
        Publishers.CombineLatest3($name, $lastName, $email)
            .map { [unowned self] name, lastName, email in
                !name.isEmpty && !lastName.isEmpty && isValid(email)
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
        } else {
            showRegistrationError = true
        }
    }
}
