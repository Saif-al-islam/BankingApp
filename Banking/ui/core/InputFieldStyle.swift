//
//  BaseTextFieldView.swift
//  Banking
//
//  Created by Saif on 28/01/2024.
//

import SwiftUI

struct InputFieldStyle: TextFieldStyle {
    
    var paddingHTrail: CGFloat = 16
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.trailing, paddingHTrail)
            .padding(.leading, 16)
            .padding(.vertical, 18)
            .background(RoundedRectangle(cornerRadius: 14, style: .continuous)
                .foregroundStyle(.colorGray1))
    }
    
    
    
}

#Preview {
    TextField("asd", text: .constant("asdasd"))
        .textFieldStyle(InputFieldStyle())
}
