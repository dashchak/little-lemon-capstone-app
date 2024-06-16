//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 15.06.2024.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    let id: Int
    let title: String
    let price: String
    let description: String
    let image: String
    let category: String
}
