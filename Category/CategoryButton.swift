//
//  CategoryButton.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation
import SwiftUI

struct CategoryButton: View {
    var category: Category
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(category.name.capitalized)
                .padding()
                .foregroundColor(Color.primaryColor1)
                .background(category.isSelected ? Color.secondaryColor3 : Color.clear)
                .cornerRadius(10)
        }
    }
}

struct CategoryButton_Preview: PreviewProvider {
    static var previews: some View {
        let category = Category(name: "Drinks", isSelected: false)
        CategoryButton(category: category) {}
        .previewDisplayName("Regular")

        let categorySelected = Category(name: "Drinks", isSelected: true)
        CategoryButton(category: categorySelected) {}
        .previewDisplayName("Selected")
    }
}

