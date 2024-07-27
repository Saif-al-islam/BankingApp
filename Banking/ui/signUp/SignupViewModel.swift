//
//  SignupViewModel.swift
//  Banking
//
//  Created by Saif on 28/01/2024.
//

import Foundation

class SignupViewModel : ObservableObject {
    
    @Published var phone: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    var isValidate: Bool {
        return !phone.isEmpty && !password.isEmpty && confirmPassword.elementsEqual(password)
    }
    
    func signUp() {
        
    }
    
}
