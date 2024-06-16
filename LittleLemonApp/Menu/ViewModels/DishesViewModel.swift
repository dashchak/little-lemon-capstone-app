import Foundation
import CoreData
import Combine


@MainActor
class DishesViewModel: ObservableObject {
    @Published var searchText: String = "" { didSet { updateFetchResults() } }
    @Published var selectedCategories: [Category] = [] { didSet { updateFetchResults() } }
    @Published var filterPredicate = NSPredicate(value: true)

    private let apiService: APIServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(apiService: APIServiceProtocol = APIService.shared) {
        self.apiService = apiService
    }

    func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "title", ascending: true,
                          selector: #selector(NSString .localizedCompare))]

    }

    func reload(_ coreDataContext: NSManagedObjectContext) async {
        do {
            let menu = try await apiService.fetchMenu()

            Dish.deleteAll(coreDataContext)
            Dish.createDishesFrom(menuItems: menu.items, coreDataContext)
        } catch {
            print(error)
        }
    }
}

private extension DishesViewModel {

    func updateFetchResults() {
        self.filterPredicate = buildPredicate()
    }

    func buildPredicate() -> NSCompoundPredicate {
        var subpredicates = [NSPredicate]()

        if selectedCategories.isEmpty {
            subpredicates.append(NSPredicate(value: false))
        } else {
            let categoryPredicates = selectedCategories.map { NSPredicate(format: "category == %@", $0.name) }
            let categoryCompoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: categoryPredicates)
            subpredicates.append(categoryCompoundPredicate)
        }

        if searchText.isEmpty {
            subpredicates.append(NSPredicate(value: true))
        } else {
            subpredicates.append(NSPredicate(format: "title CONTAINS[cd] %@", searchText))
        }

        return NSCompoundPredicate(andPredicateWithSubpredicates: subpredicates)
    }
}

