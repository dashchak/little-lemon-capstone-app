//
//  Dish+Extensions.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation
import CoreData


extension Dish {
    static func createDishesFrom(menuItems: [MenuItem],
                                 _ context: NSManagedObjectContext) {
        for menuItem in menuItems {
            if Dish.exists(name: menuItem.title, context) != true {
                let dish = Dish(context: context)
                dish.title = menuItem.title
                dish.info = menuItem.description
                dish.category = menuItem.category
                dish.price = menuItem.price
                dish.image = menuItem.image
            }
        }
    }
}
