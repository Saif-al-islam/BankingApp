//
//  User.swift
//  Banking
//
//  Created by Saif on 31/01/2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String?
    let phoneNumber: String
}
