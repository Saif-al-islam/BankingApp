//
//  BankingApp.swift
//  Banking
//
//  Created by Saif on 24/01/2024.
//

import SwiftUI

@main
struct BankingApp: App {
    @ObservedObject var router = Router()

    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                SplashView()
                    .navigationDestination(for: NavDestination.self) { dest in
                        navToDestinationView(to: dest)
                    }
            }
            .environmentObject(router)
        }
    }
}
