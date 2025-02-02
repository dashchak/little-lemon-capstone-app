//
//  FoodItemView.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct FoodItemView: View {
    @ObservedObject private var dish: Dish
    init(_ dish: Dish) {
        self.dish = dish
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dish.title ?? "")
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                Spacer()
                Text(dish.info ?? "")
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                Spacer()
                Text(dish.formatPrice())
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            }
            Spacer()
            WebImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 100, maxHeight: 100)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}


struct FoodItemView_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    static var previews: some View {
        FoodItemView(PersistenceController.mockedDish())
            .environment(\.managedObjectContext, context)
    }
}

