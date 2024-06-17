//
//  Header.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 16.06.2024.
//

import SwiftUI


struct Header: View {
    var allowProfileNavigation: Bool = true

    var body: some View {
        NavigationStack {
            ZStack {
                LogoImageView()
                HStack {
                    Spacer()
                    if UserDefaultsService.shared.isLoggedIn {
                        ProfileImageButton(destination:
                                            allowProfileNavigation ? EmptyView() : nil)
                    }
                }
            }

        }
        .frame(maxHeight: 50)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        return Header(allowProfileNavigation: true)
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)

    }
}
