//
//  SendMoneyViewModel.swift
//  Banking
//
//  Created by Saif on 31/01/2024.
//

import Foundation


class SendMoneyViewModel : ObservableObject {
    
    @Published var phone: String = ""
    @Published var cardNum: String = ""
    @Published var cardName: String = ""
    @Published var accountNum: String = ""
    @Published var amount: String = ""
    
    @Published var isLoading: Bool = false

    
    func sendMoney(selectedTab: Int, success: ()->Void, error: ()->Void) {
        isLoading = true
        
        let isValid = switch selectedTab {
        case 0: !phone.isEmpty
        case 1: !cardNum.isEmpty && !cardName.isEmpty
        case 2: !accountNum.isEmpty
        default: false
        }
        
        if isValid && !amount.isEmpty {
            success()
        } else {
            error()
        }
        
        isLoading = false
    }
    
    
}
