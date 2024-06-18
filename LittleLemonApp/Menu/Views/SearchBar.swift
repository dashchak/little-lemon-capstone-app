//
//  SearchBar.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .shadow(radius: 2)
                .frame(maxHeight: 45)

            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding(4)
                    .background(Color.white)

                TextField("Search", text: $searchText)
                    .padding(.vertical, 8)
                    .autocorrectionDisabled()
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 4) 
        }
        .padding(10)
    }
}



struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
