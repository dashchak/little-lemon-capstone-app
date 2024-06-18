//
//  Category.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation

struct Category: Identifiable {
    let id = UUID()
    let name: String
    var isSelected = true
}

extension Category: Equatable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id
    }
}
