//
//  AdManagerProtocol.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 2/1/25.
//

import Foundation
import UIKit
import VungleAdsSDK

protocol VungleManagerProtocol {
    var ad: BasePublicAd? { get }

    static func initializeSDK(completion: @escaping (Result<Void, Error>) -> Void)

    func getPlacementId() -> String
    func loadAd(completion: @escaping (Result<Void, Error>) -> Void)
    func showAd(from viewController: UIViewController, completion: @escaping (Result<Void, Error>) -> Void)
}
