//
//  OnboardingViewModel.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var name: String = "" {
        didSet { validateForm() }
    }
    @Published var lastName: String = "" {
        didSet { validateForm() }
    }
    @Published var email: String = "" {
        didSet { validateEmail(email) }
    }
    @Published var isEmailValid: Bool = true
    @Published var showError: Bool = false
    @Published var isFormValid: Bool = false

    private var cancellables = Set<AnyCancellable>()

    private func validateEmail(_ email: String) {
        let emailRegEx = #"^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\.[A-Z]{2,64}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        isEmailValid = emailPredicate.evaluate(with: email)
        validateForm()
    }

    private func validateForm() {
        isFormValid = !name.isEmpty && !lastName.isEmpty && isEmailValid
    }

    func registerUser() -> Bool {
        if isFormValid {
            showError = false
            return true
        } else {
            showError = true
            return false
        }
    }
}
