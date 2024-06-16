//
//  Image+Extensions.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation
import SwiftUI

extension Image {
    static var profileImage: some View {
        Image("profile")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: 50)
            .clipShape(Circle())
            .padding(.trailing)
    }

    static var heroImage: some View {
        Image("hero")
            .resizable()
            .aspectRatio( contentMode: .fill)
            .frame(maxWidth: 120, maxHeight: 120)
            .clipShape(Rectangle())
            .cornerRadius(16)
    }

}
