//
//  Expense.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import Foundation

struct Expense: Codable, Identifiable {
    var id: Int
    let category: Category
    let description: String
    let date: String
    let price: Float
    
    
}
