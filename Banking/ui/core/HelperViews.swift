//
//  HelperViews.swift
//  Banking
//
//  Created by Saif on 26/01/2024.
//

import SwiftUI

struct SpacerW: View {
    let width: CGFloat?
    
    var body: some View {
        Spacer()
            .frame(width: width)
    }
}

struct SpacerH: View {
    let height: CGFloat?
    
    var body: some View {
        Spacer()
            .frame(height: height)
    }
}

struct FilterChipItem: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .padding(.horizontal)
            .padding(.vertical, 10)
            .foregroundStyle(.black)
            .background(RoundedRectangle(cornerRadius: 12))
            .foregroundStyle(.colorBlue1)
    }
}

