//
//  Hero.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import SwiftUI

struct Hero: View {

    var body: some View {
        HStack {
            VStack {
                Text("Little Lemon")
                    .foregroundColor(Color.primaryColor2)
                    .font(.displayFont())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Chicago")
                    .foregroundColor(.white)
                    .font(.subTitleFont())
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .foregroundColor(.white)
                        .font(.leadText())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image.heroImage
                }
            }
        }
        .padding()
        .background(Color.primaryColor1)
        .frame(maxWidth: .infinity, maxHeight: 240)
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
    }
}
