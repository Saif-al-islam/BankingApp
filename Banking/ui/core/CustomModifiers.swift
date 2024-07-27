//
//  CustomModifiers.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import Foundation
import SwiftUI





extension View {
    func size(_ size: CGFloat) -> some View {
        frame(width: size, height: size)
    }
    
    func width(_ w: CGFloat) -> some View {
        frame(width: w)
    }
    
    func height(_ h: CGFloat) -> some View {
        frame(height: h)
    }
    
    
    
    
}
