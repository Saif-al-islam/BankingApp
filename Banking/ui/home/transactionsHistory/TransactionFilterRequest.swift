//
//  TransactionFilterRequest.swift
//  Banking
//
//  Created by Saif on 31/01/2024.
//

import Foundation

class TransactionFilterRequest {
    var type: TransactionType? = nil
    var date: Date? = nil
    
    init(type: TransactionType? = nil, date: Date? = nil) {
        self.type = type
        self.date = date
    }
    
    init() {
        
    }
    
}
