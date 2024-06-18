//
//  LittleLemonAppTests.swift
//  LittleLemonAppTests
//
//  Created by Roman Dashchakivskyi on 15.06.2024.
//

import XCTest
@testable import LittleLemonApp

class UserDefaultsServiceTests: XCTestCase {

    var service: UserDefaultsService!

    override func setUp() {
        super.setUp()
        // Initialize UserDefaultsService instance for each test
        service = UserDefaultsService()
    }

    override func tearDown() {
        // Clean up after each test
        service.clearUserData()
        service = nil
        super.tearDown()
    }

    func testUserInitialization() {
        XCTAssertEqual(service.user.firstName, "")
        XCTAssertEqual(service.user.lastName, "")
        XCTAssertEqual(service.user.email, "")
        XCTAssertEqual(service.user.phoneNumber, "")
        XCTAssertFalse(service.user.orderStatuses)
        XCTAssertFalse(service.user.passwordChanges)
        XCTAssertFalse(service.user.specialOffers)
        XCTAssertFalse(service.user.newsletter)
    }

    func testSetUserData() {
        let newUser = User(firstName: "John", lastName: "Doe", email: "john.doe@example.com", phoneNumber: "1234567890", orderStatuses: true, passwordChanges: false, specialOffers: true, newsletter: false)
        service.user = newUser

        XCTAssertEqual(service.user.firstName, "John")
        XCTAssertEqual(service.user.lastName, "Doe")
        XCTAssertEqual(service.user.email, "john.doe@example.com")
        XCTAssertEqual(service.user.phoneNumber, "1234567890")
        XCTAssertTrue(service.user.orderStatuses)
        XCTAssertFalse(service.user.passwordChanges)
        XCTAssertTrue(service.user.specialOffers)
        XCTAssertFalse(service.user.newsletter)
    }

    func testClearUserData() {
        service.user = User(firstName: "John", lastName: "Doe", email: "john.doe@example.com", phoneNumber: "1234567890", orderStatuses: true, passwordChanges: false, specialOffers: true, newsletter: false)
        service.clearUserData()

        XCTAssertEqual(service.user.firstName, "")
        XCTAssertEqual(service.user.lastName, "")
        XCTAssertEqual(service.user.email, "")
        XCTAssertEqual(service.user.phoneNumber, "")
        XCTAssertFalse(service.user.orderStatuses)
        XCTAssertFalse(service.user.passwordChanges)
        XCTAssertFalse(service.user.specialOffers)
        XCTAssertFalse(service.user.newsletter)
        XCTAssertFalse(service.isLoggedIn)
    }

    func testIsLoggedIn() {
        XCTAssertFalse(service.isLoggedIn)
        service.isLoggedIn = true
        XCTAssertTrue(service.isLoggedIn)
    }

    // Test case: Performance test to ensure clearing user data is efficient
    func testPerformanceClearUserData() {
        measure {
            service.clearUserData()
        }
    }
}
