//
//  VungleAdType.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 2/1/25.
//

import Foundation

enum VungleAdType: String {
    case interstitial = "INTERSTITIAL02-1468016"
    case rewarded = "REWARDED03-2663131"


    var placementID: String {
        return self.rawValue
    }
}
