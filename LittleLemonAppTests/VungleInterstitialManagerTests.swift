//
//  VungleInterstitialManagerTests.swift
//  LittleLemonAppTests
//
//  Created by Roman Dashchakivskyi on 2/1/25.
//

import Foundation

import XCTest
@testable import LittleLemonApp

class VungleInterstitialManagerTests: XCTestCase {
    var interstitialManager: VungleInterstitialManager!
    var mockViewController: UIViewController!

    override func setUp() {
        super.setUp()
        interstitialManager = VungleInterstitialManager()
        mockViewController = UIViewController()
    }

    override func tearDown() {
        interstitialManager = nil
        mockViewController = nil
        super.tearDown()
    }

    func testShowAdSuccess() {
        let expectation = self.expectation(description: "Ad Show Success")

        interstitialManager.loadAd { result in
            switch result {
            case .success:
                self.interstitialManager.showAd(from: self.mockViewController) { result in
                    switch result {
                    case .success:
                        XCTAssertTrue(true, "Ad displayed successfully")
                        expectation.fulfill()
                    case .failure(let error):
                        XCTFail("Ad failed to show with error: \(error.localizedDescription)")
                    }
                }
            case .failure(let error):
                XCTFail("Ad failed to load with error: \(error.localizedDescription)")
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testShowAdFailure() {
        let expectation = self.expectation(description: "Ad Show Failure")

        self.interstitialManager.ad = nil

        self.interstitialManager.showAd(from: mockViewController) { result in
            switch result {
            case .success:
                XCTFail("Ad should not have been displayed")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "Ad can't play")
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

        func testLoadAdSuccess() {
            let expectation = self.expectation(description: "Ad Load Success")
    
            interstitialManager.loadAd { result in
                switch result {
                case .success:
                    XCTAssertNotNil(self.interstitialManager.ad, "Ad should be loaded successfully")
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Ad failed to load with error: \(error.localizedDescription)")
                }
            }
    
            waitForExpectations(timeout: 5, handler: nil)
        }
}
