//
//  RegistrationView.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    @State var showError = false

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Header()
                    VStack {
                        Text("First name *")
                            .onboardingTextStyle()
                        TextField("First Name", text: $viewModel.firstName)
                        Text("Last name *")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $viewModel.lastName)
                        Text("Email *")
                            .onboardingTextStyle()
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()

                    if viewModel.showRegistrationError {
                        Text("Please fill in all fields correctly. And try again")
                            .foregroundColor(.red)
                            .padding(.bottom)
                    }

                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        return RegistrationView(viewModel: RegistrationViewModel())
    }
}
