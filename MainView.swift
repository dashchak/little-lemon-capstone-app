//
//  MainView.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation
import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @StateObject private var categoriesViewModel = CategoriesViewModel()
    @StateObject private var dishesViewModel = FoodMenuListModel()
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Header()
                VStack {
                    Hero()
                    SearchBar(searchText: $searchText)
                        .padding(.bottom)
                }
                .background(Color.primaryColor1)

                SectionTitleView(title: "ORDER FOR DELIVERY!")
                CategoriesView(viewModel: categoriesViewModel)
                FoodMenuList(viewModel: dishesViewModel)
            }
            .onChange(of: searchText) { oldValue, newValue in
                dishesViewModel.searchText = newValue
            }
            .onChange(of: categoriesViewModel.selectedCategories) { oldValue, newValue in
                dishesViewModel.selectedCategories = newValue
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        return MainView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
