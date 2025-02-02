//
//   AdManagerFactory.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 2/1/25.
//

import Foundation

protocol VungleManagerFactoryProtocol {
    func createManager(for type: VungleAdType) -> VungleManagerProtocol
}

class VungleManagerFactory {
    static let shared = VungleManagerFactory()
    private init() {}
}

extension VungleManagerFactory: VungleManagerFactoryProtocol {
    func createManager(for type: VungleAdType) -> VungleManagerProtocol {
        switch type {
        case .interstitial:
            return VungleInterstitialManager()
        case .rewarded:
            return VungleRewardedManager()
        }
    }
}
