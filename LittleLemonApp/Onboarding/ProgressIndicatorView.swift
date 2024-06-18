//
//  ProgressIndicatorView.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 17.06.2024.
//

import Foundation
import SwiftUI

struct ProgressIndicatorView: View {
    var currentPageIndex: Int
    let totalPages: Int

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(index == currentPageIndex ? Color.primaryColor2 : Color.primaryColor1)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

struct ProgressIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicatorView(currentPageIndex: 2, totalPages: 5)
    }
}
