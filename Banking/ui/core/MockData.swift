//
//  MockData.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import Foundation

struct MockData {
    
    
    static let expensesList: [Expense] = [
        Expense(
            id: 1,
            category: categoriesList[0],
            description: "",
            date: "12 June, 2024",
            price: 12
        )
        , Expense(
            id: 2,
            category: categoriesList[1],
            description: "",
            date: "12 June, 2024",
            price: 66
        )
        , Expense(
            id: 3,
            category: categoriesList[2],
            description: "For the tickets",
            date: "12 June, 2024",
            price: 232
        )
        , Expense(
            id: 4,
            category: categoriesList[1],
            description: "",
            date: "13 June, 2024",
            price: 544
        )
    ]
    
    static let categoriesList: [Category] = [
        Category(id: 1, name: "clothes", image: "tshirt.fill"),
        Category(id: 2, name: "Food", image: "fork.knife"),
        Category(id: 3, name: "Travel", image: "airplane.arrival")
    ]
     
    static let transactionsList: [Transaction] = [
        Transaction(id: 1, otherUser: usersList[0], type: .send, date: "12 May 2023", amount: 1400),
        Transaction(id: 2, otherUser: usersList[1], type: .receive, date: "12 Jan 2024", amount: 423),
        Transaction(id: 3, otherUser: usersList[2], type: .send, date: "31 Jan 2024", amount: 7654),
        Transaction(id: 4, otherUser: usersList[0], type: .receive, date: "7 Sep 2022", amount: 243),
        Transaction(id: 5, otherUser: usersList[2], type: .send, date: "4 Nov 2023", amount: 10000)
    ]
    
    static let usersList: [User] = [
        User(
            id: 1,
            name: "saif elislam",
            imageUrl: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            phoneNumber: "02342404324"
        ),
        User(
            id: 2,
            name: "Ahmed moahmed",
            imageUrl: "https://learn.microsoft.com/en-us/training/media/career-paths/business-user/Business%20User.png",
            phoneNumber: "011343434234"
        ),
        User(
            id: 3,
            name: "Eslam abd-elrahman",
            imageUrl: "",
            phoneNumber: "01374873334"
        )
    ]
    
    
}
