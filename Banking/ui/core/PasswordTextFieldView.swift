//
//  PasswordTextFieldView.swift
//  Banking
//
//  Created by Saif on 28/01/2024.
//

import SwiftUI

struct PasswordTextFieldView: View {
    @State private var isShowingPass = false
    @Binding var text: String
    let title: LocalizedStringKey
    
    
    
    var body: some View {
        Group {
            if isShowingPass {
                TextField(title, text: $text)
            }
            else {
                SecureField(title, text: $text)
            }
        }
        .overlay(alignment: .trailing) {
            Image(systemName: (isShowingPass) ? "eye.slash.fill" : "eye.fill")
                .padding(.trailing)
                .onTapGesture {
                    isShowingPass = !isShowingPass
                }
        }
    }
}

#Preview {
    PasswordTextFieldView(text: .constant("123"), title: "")
}
