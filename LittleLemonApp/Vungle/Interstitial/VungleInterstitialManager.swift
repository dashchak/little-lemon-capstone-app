//
//  VungleInterstitialManager.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 2/1/25.
//

import Foundation
import VungleAdsSDK
import UIKit


class VungleInterstitialManager: VungleManagerBase {
    private var loadCompletion: ((Result<Void, Error>) -> Void)?

    override func getPlacementId() -> String {
        return VungleAdConfig.placementID(for: .interstitial)
    }

    override func loadAdLogic(completion: @escaping (Result<Void, Error>) -> Void) {
        let specificAd = VungleInterstitial(placementId: getPlacementId())
        specificAd.delegate = self

        ad = specificAd
        ad?.load()
        self.loadCompletion = completion
    }

    override func showAd(from viewController: UIViewController, completion: @escaping (Result<Void, Error>) -> Void) {
        if let ad = self.ad as? VungleInterstitial, ad.canPlayAd() {
            ad.present(with: viewController)
            completion(.success(()))
        } else {
            completion(.failure(NSError(domain: "Interstitial", code: 0, userInfo: [NSLocalizedDescriptionKey: "Ad can't play"])))
        }
    }
}

extension VungleInterstitialManager: VungleInterstitialDelegate {
    func interstitialAdDidLoad(_ interstitial: VungleInterstitial) {
        print("Ad loaded successfully")
        loadCompletion?(.success(()))
    }

    func interstitialAdDidFailToLoad(_ interstitial: VungleInterstitial, withError: NSError) {
        print("Failed to load ad: \(withError.localizedDescription)")
        loadCompletion?(.failure(withError))
    }

    func interstitialAdDidClose(_ interstitial: VungleInterstitial) {
        print("Ad closed")
    }
}
