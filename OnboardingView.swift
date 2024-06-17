//
//  Onboarding.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//
import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Header()
                    Hero()
                        .padding()
                        .background(Color.primaryColor1)
                        .frame(maxWidth: .infinity, maxHeight: 240)
                    VStack {
                        Text("First name *")
                            .onboardingTextStyle()
                        TextField("First Name", text: $viewModel.name)
                        Text("Last name *")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $viewModel.lastName)
                        Text("E-mail *")
                            .onboardingTextStyle()
                        TextField("E-mail", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()

                    if viewModel.showRegistrationError {
                        Text("Please fill in all fields correctly")
                            .foregroundColor(.red)
                            .padding(.bottom)
                    }

                    Button("Register") {
                        viewModel.registerUser()
                    }
                    .disabled(!viewModel.isFormValid)
                    .buttonStyle(ButtonStyleYellowColorWide())

                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        return OnboardingView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
