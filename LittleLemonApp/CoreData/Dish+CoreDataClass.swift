//
//  Dish+CoreDataClass.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//
//

import Foundation
import CoreData


@objc(Dish)
public class Dish: NSManagedObject {
    func formatPrice() -> String {
        return "$" + String(format: "%.2f", Double(price ?? "0") ?? 0)
    }
}
