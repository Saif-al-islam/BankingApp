//
//  ExpensesViewModel.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import Foundation
import Combine

class ExpensesViewModel: ObservableObject {
    
    @Published var totalExpenses: Int = 1334
    @Published var isShowingEditBalance = false
    @Published var isShowingAddExpense = false
    @Published var selectedCategory: String = ""
    @Published var selectedDate: String = ""
    
    var expensesListMain: [Expense]? = MockData.expensesList
    @Published var expenses: [Expense]?
    @Published var categories: [Category]? = MockData.categoriesList
   

    private var subscribers = Set<AnyCancellable>()
    
    init() {
        expensesListMain = MockData.expensesList
        expenses = expensesListMain
        
        self.$selectedCategory.sink { catName in
            self.expenses = if catName.isEmpty {
                self.expensesListMain
            } else {
                self.expensesListMain?.filter { item in
                    catName == item.category.name
                }
            }
            
        }
        .store(in: &subscribers)
        
//        self.$selectedDate.sink { date in
//            self.expenses = if date.isEmpty {
//                self.expensesListMain
//            } else {
//                self.expensesListMain?.filter { item in
//                    catName == item.category.name
//                }
//            }
//            
//        }
//        .store(in: &subscribers)
    }
    
    func addExpense(_ expense: Expense) {
        var newEx = expense
        newEx.id = Int.random(in: 100...1000)
        expenses?.append(newEx)
    }
    
    
    func resetFilter() {
        self.expenses = self.expensesListMain
    }
    
}
