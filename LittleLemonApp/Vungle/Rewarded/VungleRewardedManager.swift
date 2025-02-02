//
//  VungleRewardedManager.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 2/1/25.
//

import Foundation
import VungleAdsSDK
import UIKit


class VungleRewardedManager: VungleManagerBase {
    private var loadCompletion: ((Result<Void, Error>) -> Void)?

    override func getPlacementId() -> String {
        return VungleAdConfig.placementID(for: .rewarded)
    }

    override func loadAdLogic(completion: @escaping (Result<Void, Error>) -> Void) {
        let specificAd = VungleRewarded(placementId: getPlacementId())
        specificAd.delegate = self

        ad = specificAd
        ad?.load()
        self.loadCompletion = completion
    }

    override func showAd(from viewController: UIViewController, completion: @escaping (Result<Void, Error>) -> Void) {
        if let ad = self.ad as? VungleRewarded, ad.canPlayAd() {
            ad.present(with: viewController)
            completion(.success(()))
        } else {
            completion(.failure(NSError(domain: "Rewarded", code: 0, userInfo: [NSLocalizedDescriptionKey: "Ad can't play"])))
        }
    }
}

extension VungleRewardedManager: VungleRewardedDelegate {
    // Ad load events
    func rewardedAdDidLoad(_ rewarded: VungleRewarded) {
        print("rewardedAdDidLoad")
        loadCompletion?(.success(()))
    }

    func rewardedAdDidFailToLoad(_ rewarded: VungleRewarded, withError: NSError) {
        print("Failed to load ad: \(withError.localizedDescription)")
        loadCompletion?(.failure(withError))
    }
}
