//
//  LogInViewModel.swift
//  Banking
//
//  Created by Saif on 28/01/2024.
//

import Foundation


class LogInViewModel : ObservableObject {
    
    @Published var phone: String = ""
    @Published var password: String = ""
    
    var isValidate: Bool {
        return !phone.isEmpty && !password.isEmpty
    }
    
    func logIn() {
        
    }
    
}

