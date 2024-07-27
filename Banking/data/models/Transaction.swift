//
//  Transaction.swift
//  Banking
//
//  Created by Saif on 30/01/2024.
//

import Foundation

struct Transaction: Codable, Identifiable {
    let id: Int
    let otherUser: User
    let type: TransactionType
    let date: String
    let amount: Float
    
}


