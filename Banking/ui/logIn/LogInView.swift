//
//  LogInView.swift
//  Banking
//
//  Created by Saif on 28/01/2024.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var router: Router
    @StateObject var viewModel = LogInViewModel()
 
    var body: some View {
        VStack {
            Spacer()
            
            Text("sign-in-now")
                .fontWeight(.semibold)
                .font(.largeTitle)
            Text("sign-in-msg")
                .foregroundStyle(.gray)
            
            SpacerH(height: 60)
            
            TextField("phone-number", text: $viewModel.phone)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(InputFieldStyle())
            
            SpacerH(height: 32)
            
            PasswordTextFieldView(text: $viewModel.password, title: "password")
                .textFieldStyle(InputFieldStyle(paddingHTrail: 55))
            
            SpacerH(height: 60)
            
            Button("sign-in") {
                // TODO: Sign In Func
                if viewModel.isValidate {
                    router.popAllAndNav(to: .Home)
                }
            }
            .buttonStyle(BaseButtonStyle())
            
            Spacer()
            
            HStack {
                Text("Don’t have an account?")
                    .foregroundStyle(.gray)
                SpacerW(width: 12)
                Text("Sign up")
                    .foregroundStyle(.accent)
                    .fontWeight(.medium)
                    .padding(4)
                    .onTapGesture {
                        router.nav(to: .SignUp)
                    }
            }
            
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LogInView()
}
