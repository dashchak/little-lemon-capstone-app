//
//  FoodItemDetailsView.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 17.06.2024.
//

import Foundation

import SwiftUI
import SDWebImageSwiftUI

struct FoodItemDetailsView: View {

    @Environment(\.managedObjectContext) private var viewContext

    let dish: Dish

    var body: some View {
        VStack {
            Header()
            WebImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            Text(dish.title ?? "")
                .font(.subTitleFont())
                .foregroundColor(.primaryColor1)
            Text(dish.info ?? "")
                .font(.regularText())
            Text("$" + (dish.price ?? ""))
                .font(.highlightText())
                .foregroundColor(.primaryColor1)
                .monospaced()
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemDetailsView(dish: PersistenceController.mockedDish())
    }
}
