//
//  FabButtonView.swift
//  Banking
//
//  Created by Saif on 31/01/2024.
//

import Foundation
import SwiftUI

struct FabButtonView: View {
    var systemIcon: String? = nil
    var resIcon: String? = nil
    let iconColor: Color = .white
    let bckColor: Color = .accent
    let action: ()->Void
    
    init(resIcon: String, action: @escaping () -> Void) {
        self.resIcon = resIcon
        self.action = action
    }
    
    init(systemIcon: String, action: @escaping () -> Void) {
        self.systemIcon = systemIcon
        self.action = action
    }
    
    var body: some View {
        Button(action: action
               , label: {
            (resIcon == nil ? Image(systemName: systemIcon!) : Image(resIcon!))
                .tint(iconColor)
                .padding(20)
                .background(bckColor)
                .clipShape(Circle())
        })
        .padding()
    }
}
