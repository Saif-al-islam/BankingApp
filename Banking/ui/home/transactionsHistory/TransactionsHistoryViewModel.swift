//
//  TransactionsHistoryViewModel.swift
//  Banking
//
//  Created by Saif on 30/01/2024.
//

import Foundation

class TransactionsHistoryViewModel : ObservableObject {
    
    @Published var isShowingFilter = false

    @Published var historyFilteredList: [Transaction]?
    var historyList: [Transaction]?
    
    let filterTrans = TransactionFilterRequest()
    
    init() {
        historyList = MockData.transactionsList
        historyFilteredList = historyList
    }
    
    
    func filter(_ req: TransactionFilterRequest?) {
        if let req = req {
            
            historyFilteredList = historyList?.filter { item in
                return (req.type == nil || req.type == item.type) && (req.date == nil || Utils.isDatesAfterFst(date1: req.date!,
                                                                                                            date2: item.date.toDate()!))
            }
            
        } else {
            historyFilteredList = historyList
        }
     }
    
    
    
}
