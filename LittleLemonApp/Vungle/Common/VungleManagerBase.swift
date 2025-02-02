//
//  VungleManagerBase.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 2/1/25.
//

import Foundation
import VungleAdsSDK
import UIKit

class VungleManagerBase: NSObject, VungleManagerProtocol {
    static func initializeSDK(completion: @escaping (Result<Void, Error>) -> Void) {
        guard !VungleAds.isInitialized() else {
            completion(.success(()))
            return
        }

        DispatchQueue.global().async {
            VungleAds.initWithAppId(VungleAdConfig.appID) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        }
    }

    var ad: BasePublicAd?

    func loadAd(completion: @escaping (Result<Void, Error>) -> Void) {
        if !VungleAds.isInitialized() {
            VungleManagerBase.initializeSDK() { result in
                switch result {
                case .success:
                    self.loadAdLogic(completion: completion)
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            loadAdLogic(completion: completion)
        }
    }

    func getPlacementId() -> String {
        fatalError("Subclasses must implement getPlacementId()")
    }

    func loadAdLogic(completion: @escaping (Result<Void, Error>) -> Void) {
        fatalError("Subclasses must implement loadAdLogic()")
    }

    func showAd(from viewController: UIViewController, completion: @escaping (Result<Void, any Error>) -> Void) {
        fatalError("Subclasses must implement showAd(from:completion:)")
    }
}
