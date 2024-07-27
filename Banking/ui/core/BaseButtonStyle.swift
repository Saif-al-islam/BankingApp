//
//  BaseButtonStyle.swift
//  Banking
//
//  Created by Saif on 28/01/2024.
//

import Foundation
import SwiftUI

struct BaseButtonStyle : ButtonStyle {
    
    var bgColor: Color = .accent

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical, 18)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                    .foregroundStyle(bgColor)
            )
            
    }
    
    
}


#Preview {
    Button("Next") {
        
    }
    .buttonStyle(BaseButtonStyle())
}
