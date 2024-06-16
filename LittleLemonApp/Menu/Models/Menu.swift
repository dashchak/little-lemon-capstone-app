//
//  Menu.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation

struct Menu: Codable {
    let items: [MenuItem]

    enum CodingKeys: String, CodingKey {
        case items = "menu"
    }
}
