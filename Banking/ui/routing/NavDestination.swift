//
//  NavDestination.swift
//  Travenor
//
//  Created by Saif on 22/01/2024.
//

import Foundation
import SwiftUI

enum NavDestination : Codable, Hashable {
    case Splash
    case LogIn
    case SignUp
    case Home
    case SendMoney
    case Bils(type:BillTypes)
}

@ViewBuilder func navToDestinationView(to dest: NavDestination) -> some View {
    switch dest {
    case .Splash:
        SplashView()
    case .Home:
        HomeView()
    case .SendMoney:
        SendMoneyView()
    case let .Bils(type):
        BillsView(billType: type)
    case .LogIn:
        LogInView()
    case .SignUp:
        SignUpView()
    }
}
