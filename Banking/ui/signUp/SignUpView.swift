//
//  SignUpView.swift
//  Banking
//
//  Created by Saif on 28/01/2024.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var router: Router
    @StateObject var viewModel = SignupViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image(systemName: "chevron.backward")
                        .padding()
                        .onTapGesture {
                            router.pop()
                        }
                    Spacer()
                }
                
                SpacerH(height: 50)
                
                Text("sign-up-now")
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                Text("sign-up-msg")
                    .foregroundStyle(.gray)
                
                SpacerH(height: 60)
                
                TextField("name", text: $viewModel.name)
                    .textContentType(.name)
                    .textFieldStyle(InputFieldStyle())
                
                
                SpacerH(height: 24)
                
                TextField("phone-number", text: $viewModel.phone)
                    .textContentType(.telephoneNumber)
                    .textFieldStyle(InputFieldStyle())
                    .keyboardType(.phonePad)
                
                SpacerH(height: 24)
                
                PasswordTextFieldView(text: $viewModel.password, title: "password")
                    .textFieldStyle(InputFieldStyle(paddingHTrail: 55))
                
                SpacerH(height: 24)
                
                PasswordTextFieldView(text: $viewModel.confirmPassword, title: "confirm-password")
                    .textFieldStyle(InputFieldStyle(paddingHTrail: 55))
                
                SpacerH(height: 60)
                
                Button("sign-up") {
                    // TODO: Sign UP Func
                    if viewModel.isValidate {
                        router.popAllAndNav(to: .Home)
                    }
                }
                .buttonStyle(BaseButtonStyle())
                
                SpacerH(height: 12)
                
                HStack {
                    Text("have-account-msg")
                        .foregroundStyle(.gray)
                    
                    SpacerW(width: 12)
                    
                    Text("Sign in")
                        .foregroundStyle(.accent)
                        .fontWeight(.medium)
                        .padding(4)
                        .onTapGesture {
                            router.pop()
                        }
                }
                
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    SignUpView()
}
