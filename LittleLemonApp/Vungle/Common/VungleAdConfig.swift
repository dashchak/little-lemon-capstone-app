//
//  VungleAdConfig.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 2/1/25.
//

import Foundation

struct VungleAdConfig {
    static let appID = "5e13cc9d61880b27a65bf735"

    static func placementID(for adType: VungleAdType) -> String {
        return adType.placementID
    }
}
