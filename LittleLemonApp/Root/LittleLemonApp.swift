//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 15.06.2024.
//

import SwiftUI
import VungleAdsSDK

@main
struct LittleLemonAppApp: App {
    let persistenceController = PersistenceController.shared
    let adManager = VungleManagerFactory.shared.createManager(for: .interstitial)

    init() {
        VungleManagerBase.initializeSDK { result in
            switch result {
            case .success:
                print("SDK Initialized")
            case .failure(let error):
                print("Failed to initialize Vungle SDK: \(error.localizedDescription)")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .onAppear {
                    loadAndShowAd()
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }

    private func loadAndShowAd() {
        adManager.loadAd { result in
            switch result {
            case .success:
                self.showAd()
            case .failure(let error):
                print("Failed to load ad: \(error.localizedDescription)")
            }
        }
    }

    private func showAd() {
        guard let rootViewController = UIApplication.shared.currentUIWindow()?.rootViewController else {
            print("Root ViewController not found")
            return
        }

        adManager.showAd(from: rootViewController) { result in
            switch result {
            case .success:
                print("Ad presented successfully")
            case .failure(let error):
                print("Failed to present ad: \(error.localizedDescription)")
            }
        }
    }
}
