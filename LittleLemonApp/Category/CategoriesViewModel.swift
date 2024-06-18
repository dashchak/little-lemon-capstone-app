//
//  CategoriesViewModel.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation

import SwiftUI

class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category] = [
        Category(name: "starters"),
        Category(name: "mains"),
        Category(name: "desserts"),
        Category(name: "drinks")
    ]

    @Published private(set) var selectedCategories: [Category] = []

    init() {
        selectedCategories = categories
    }

    func toggleCategorySelection(category: Category) {
        if let index = categories.firstIndex(where: { $0.id == category.id }) {
            categories[index].isSelected.toggle()
            updateSelectedCategories()
        }
    }

    private func updateSelectedCategories() {
        selectedCategories = categories.filter { $0.isSelected }
    }
}
