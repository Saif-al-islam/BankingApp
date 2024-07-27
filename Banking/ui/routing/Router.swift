//
//  Router.swift
//  Travenor
//
//  Created by Saif on 22/01/2024.
//

import Foundation
import SwiftUI

final class Router : ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    func nav(to destination: NavDestination) {
        navPath.append(destination)
    }
    
    func pop() {
        navPath.removeLast()
    }
    
    func navToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    func popAllAndNav(to destination: NavDestination) {
        navPath.removeLast(navPath.count)
        nav(to: destination)

    }
    
}
