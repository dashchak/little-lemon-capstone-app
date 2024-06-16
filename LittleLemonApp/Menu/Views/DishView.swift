//
// DishView.swift



import SwiftUI


struct DishView: View {
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
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
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


struct DishView_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    static var previews: some View {
        DishView(oneDish())
            .environment(\.managedObjectContext, context)

    }
    static func oneDish() -> Dish {
        let dish = Dish(context: context)
        dish.title = "Greek Salad"
        dish.price = "10.0"
        dish.category = "starters"
        dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
        dish.info = "The famous greek salad of crispy lettuce, peppers, olives, our Chicago."
        return dish
    }
}

