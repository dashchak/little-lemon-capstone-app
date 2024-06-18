//
//  LogoImageView.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import SwiftUI

struct LogoImageView: View {
    var body: some View {
        Image("littleLemon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: 50)
    }
}

struct LogoImageView_Previews: PreviewProvider {
    static var previews: some View {
        LogoImageView()
    }
}
