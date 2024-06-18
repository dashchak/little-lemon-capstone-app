//
//  FoodMenuList.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import SwiftUI
import CoreData

struct FoodMenuList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: FoodMenuListModel

    var body: some View {
        VStack {
            NavigationView {
                FetchedObjects(
                    predicate: viewModel.filterPredicate,
                    sortDescriptors: viewModel.buildSortDescriptors()) {
                        (dishes: [Dish]) in
                        List(dishes) { dish in
                            NavigationLink(destination: FoodItemDetailsView(dish: dish)) {
                                FoodItemView(dish)
                            }
                        }
                        .listStyle(.plain)
                    }
            }
            .scrollContentBackground(.hidden)
            .task {
                await viewModel.reload(viewContext)
            }
        }
    }
}

struct FoodMenuList_Previews: PreviewProvider {
    static var previews: some View {
        FoodMenuList(viewModel: FoodMenuListModel())
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
