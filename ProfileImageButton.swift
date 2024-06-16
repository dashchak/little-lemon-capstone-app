//
//  ProfileImageButton.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation
import SwiftUI

struct ProfileImageButton<Content: View>: View {
    let destination: Content?

    var body: some View {
        if let destination {
            NavigationLink(destination: destination) {
                Image.profileImage
            }
        } else {
            Image.profileImage
        }
    }
}
