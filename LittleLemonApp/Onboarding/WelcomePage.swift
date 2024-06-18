//
//  WelcomePage.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 17.06.2024.
//

import Foundation
import SwiftUI

struct WelcomePage: View {
    let text: String

    var body: some View {
        VStack {
            Header()
            Hero()
            Spacer()
    
            Text(text)
                .font(.welcomeFont())
                .foregroundColor(Color.primaryColor1)

            Spacer()
        }
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage(text: "Welcome !!!")
    }
}
