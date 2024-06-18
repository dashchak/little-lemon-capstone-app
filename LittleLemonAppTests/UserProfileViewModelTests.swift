//
//  UserProfileViewModelTests.swift
//  LittleLemonAppTests
//
//  Created by Roman Dashchakivskyi on 18.06.2024.
//

import XCTest
@testable import LittleLemonApp

class UserProfileViewModelTests: XCTestCase {

    var viewModel: UserProfileViewModel!

    override func setUp() {
        super.setUp()
        viewModel = UserProfileViewModel()
    }

    override func tearDown() {
        UserDefaultsService.shared.clearUserData()
        viewModel = nil
        super.tearDown()
    }

    func testValidateUserInputs_AllFieldsEmpty() {
        // Arrange
        viewModel.user = User(firstName: "", lastName: "", email: "", phoneNumber: "", 
                              orderStatuses: false, passwordChanges: false, specialOffers: false, 
                              newsletter: false)

        // Act
        let result = viewModel.validateUserInputs()

        // Assert
        XCTAssertFalse(result)
        XCTAssertEqual(viewModel.errorMessage, "Please fill in all fields.")
        XCTAssertTrue(viewModel.errorMessageShow)
    }

    func testValidateUserInputs_AllFieldsFilled() {
        // Arrange
        viewModel.user = User(firstName: "John", lastName: "Doe", email: "john.doe@example.com", 
                              phoneNumber: "1234567890", orderStatuses: false, 
                              passwordChanges: false, specialOffers: false, newsletter: false)

        // Act
        let result = viewModel.validateUserInputs()

        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertFalse(viewModel.errorMessageShow)
    }

    func testDiscardChanges() {
        // Arrange: Modify viewModel.user
        viewModel.user.firstName = "Jane"
        viewModel.user.lastName = "Smith"

        // Act: Call discardChanges to reset viewModel.user
        viewModel.discardChanges()

        // Assert
        XCTAssertEqual(viewModel.user.firstName, UserDefaultsService.shared.user.firstName)
        XCTAssertEqual(viewModel.user.lastName, UserDefaultsService.shared.user.lastName)
    }

    func testSaveChanges() {
        // Arrange
        let newUser = User(firstName: "Alice", lastName: "Wonderland", email: "alice@example.com", 
                           phoneNumber: "9876543210", orderStatuses: true, passwordChanges: true,
                           specialOffers: true, newsletter: true)
        viewModel.user = newUser

        // Act
        viewModel.saveChanges()

        // Assert
        XCTAssertEqual(UserDefaultsService.shared.user.firstName, newUser.firstName)
        XCTAssertEqual(UserDefaultsService.shared.user.lastName, newUser.lastName)
        XCTAssertEqual(UserDefaultsService.shared.user.email, newUser.email)
        XCTAssertEqual(UserDefaultsService.shared.user.phoneNumber, newUser.phoneNumber)
        XCTAssertEqual(UserDefaultsService.shared.user.orderStatuses, newUser.orderStatuses)
        XCTAssertEqual(UserDefaultsService.shared.user.passwordChanges, newUser.passwordChanges)
        XCTAssertEqual(UserDefaultsService.shared.user.specialOffers, newUser.specialOffers)
        XCTAssertEqual(UserDefaultsService.shared.user.newsletter, newUser.newsletter)
    }

    func testObtainData() {
        // Arrange
        let newUser = User(firstName: "Test", lastName: "User", email: "test.user@example.com",
                           phoneNumber: "5555555555", orderStatuses: true, passwordChanges: false,
                           specialOffers: true, newsletter: false)
        UserDefaultsService.shared.user = newUser

        // Act
        viewModel.obtainData()

        // Assert
        XCTAssertEqual(viewModel.user.firstName, UserDefaultsService.shared.user.firstName)
        XCTAssertEqual(viewModel.user.lastName, UserDefaultsService.shared.user.lastName)
        XCTAssertEqual(viewModel.user.email, UserDefaultsService.shared.user.email)
        XCTAssertEqual(viewModel.user.phoneNumber, UserDefaultsService.shared.user.phoneNumber)
        XCTAssertEqual(viewModel.user.orderStatuses, UserDefaultsService.shared.user.orderStatuses)
        XCTAssertEqual(viewModel.user.passwordChanges, UserDefaultsService.shared.user.passwordChanges)
        XCTAssertEqual(viewModel.user.specialOffers, UserDefaultsService.shared.user.specialOffers)
        XCTAssertEqual(viewModel.user.newsletter, UserDefaultsService.shared.user.newsletter)
    }
}

