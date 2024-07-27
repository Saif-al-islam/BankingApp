//
//  CardView.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import SwiftUI

struct CardView<Content: View>: View  {
    let cornerRadius: CGFloat
    let color: Color
    let content: Content
    let shadowRadius: CGFloat
    let shadowX: CGFloat
    let shadowY: CGFloat
    let contentPadding: EdgeInsets
    
    init(
        color: Color = .white,
        cornerRadius: CGFloat = 10,
        contentPadding: EdgeInsets = EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12),
        shadowRadius: CGFloat = 2,
        shadowX: CGFloat = 0,
        shadowY: CGFloat = 0,
        @ViewBuilder _ content: () -> Content
    ) {
        self.content = content()
        self.cornerRadius = cornerRadius
        self.color = color
        self.contentPadding = contentPadding
        self.shadowRadius = shadowRadius
        self.shadowX = shadowX
        self.shadowY = shadowY
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(color)
                .shadow(radius: shadowRadius, x: shadowX, y: shadowY)
            
            content
                .padding(contentPadding)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    CardView(color: .red) {
        Text("Welcome")
    }
    .padding(.horizontal)
}
