//
//  UIApplication+Extensions.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 2/2/25.
//

import Foundation
import UIKit

public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }

        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }

        return window
    }
}
