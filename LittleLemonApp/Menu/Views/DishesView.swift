import SwiftUI
import CoreData

struct DishesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: DishesViewModel

    var body: some View {
        VStack {
            NavigationView {
                FetchedObjects(
                    predicate: viewModel.filterPredicate,
                    sortDescriptors: viewModel.buildSortDescriptors()) {
                        (dishes: [Dish]) in
                        List {
                            ForEach(dishes, id:\.self) {
                                DishView($0)
                            }
                        }
                    }
            }
            .scrollContentBackground(.hidden)
            .task {
                await viewModel.reload(viewContext)
            }
        }
    }
}

extension DishesView {
}

//struct DishesView_Previews: PreviewProvider {
//    static var previews: some View {
//        DishesView()
//            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
//    }
//}
