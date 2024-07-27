//
//  AccountViewModel.swift
//  Banking
//
//  Created by Saif on 01/02/2024.
//

import Foundation

class AccountViewModel: ObservableObject {
    
    @Published var user: User? = nil
    
    init() {
        self.user = MockData.usersList[0]
    }
    
}
