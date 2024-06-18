//
//  OnboardingContainerView.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 17.06.2024.
//

import Foundation
import SwiftUI


struct OnboardingContainerView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var currentPageIndex = 0
    private let totalPages = 3

    var body: some View {
        VStack {
            Spacer()

            if currentPageIndex == 0 {
                WelcomePage(text: "Welcome to the Little Lemon app!\nThe app fetches the restaurant's menu and presents it on the screen for you!")
            } else if currentPageIndex == 1 {
                WelcomePage(text: "You can search for your favorite dishes and filter the results by category.")
            } else if currentPageIndex == 2 {
                RegistrationView(viewModel: viewModel)
            }

            Spacer()

            ProgressIndicatorView(currentPageIndex: currentPageIndex, totalPages: totalPages)
                .padding()

            Button(action: {
                if self.currentPageIndex < self.totalPages - 1 {
                    self.currentPageIndex += 1
                } else {
                    viewModel.registerUser()
                }
            }) {
                Text(currentPageIndex < self.totalPages - 1 ? "Next" : "Register")
            }
            .buttonStyle(ButtonStyleYellowColorWide())
            .padding()
        }
        .padding()
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainerView()
    }
}
