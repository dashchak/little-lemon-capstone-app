////
////  UserProfile.swift
////  LittleLemonApp
////
////  Created by Roman Dashchakivskyi on 16.06.2024.
////

import SwiftUI

struct UserProfileView: View {
    @StateObject private var viewModel = UserProfileViewModel()
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 5) {
                VStack {
                    Text("Avatar")
                        .onboardingTextStyle()
                    HStack(spacing: 0) {
                        ProfileImageButton<Text>(destination: nil)
                        Button("Change") { }
                            .buttonStyle(ButtonStylePrimaryColor1())
                        Button("Remove") { }
                            .buttonStyle(ButtonStylePrimaryColorReverse())
                        Spacer()
                    }
                }
                VStack{
                    Text("First name")
                        .onboardingTextStyle()
                    TextField("First Name", text: $viewModel.user.firstName)
                }
                VStack {
                    Text("Last name")
                        .onboardingTextStyle()
                    TextField("Last Name", text: $viewModel.user.lastName)

                }
                VStack {
                    Text("Email")
                        .onboardingTextStyle()
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                }
                VStack {
                    Text("Phone number")
                        .onboardingTextStyle()
                    TextField("Phone number", text: $viewModel.user.phoneNumber)
                        .keyboardType(.phonePad)
                }
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()

            Text("Email notifications")
                .font(.sectionTitle())
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                Toggle("Order statuses", isOn: $viewModel.user.orderStatuses)
                Toggle("Password changes", isOn: $viewModel.user.passwordChanges)
                Toggle("Special offers", isOn: $viewModel.user.specialOffers)
                Toggle("Newsletter", isOn: $viewModel.user.newsletter)
            }
            .padding()
            .font(Font.leadText())
            .foregroundColor(.primaryColor1)

            Button("Log out") {
                UserDefaultsService.shared.clearUserData()
            }
            .buttonStyle(ButtonStyleYellowColorWide())
            
            Spacer(minLength: 20)

            if viewModel.errorMessageShow {
                withAnimation() {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }

            HStack {
                Button("Discard Changes") {
                    viewModel.discardChanges()
                    self.presentation.wrappedValue.dismiss()
                }
                    .buttonStyle(ButtonStylePrimaryColorReverse())
                Button("Save changes") {
                    if viewModel.validateUserInputs() {
                        viewModel.saveChanges()
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                    .buttonStyle(ButtonStylePrimaryColor1())
            }
        }
        .task {
            viewModel.obtainData()
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
