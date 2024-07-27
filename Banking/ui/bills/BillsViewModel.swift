//
//  BillsViewModek.swift
//  Banking
//
//  Created by Saif on 31/01/2024.
//

import Foundation

class BillsViewModel: ObservableObject {
    
    @Published var number: String = ""
    @Published var isLoading: Bool = false
    
    
    
    func payBill(success: ()->Void, error: ()->Void) {
        isLoading = true
        
        if number.isEmpty {
            error()
        } else {
            success()
        }
        isLoading = false
    }
    
    
    
}
