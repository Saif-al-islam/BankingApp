//
//  TransactionsView.swift
//  Banking
//
//  Created by Saif on 24/01/2024.
//

import SwiftUI

struct TransactionsHistoryView: View {
    @StateObject var viewModel = TransactionsHistoryViewModel()
    
    var body: some View {
        VStack {
            Text("transaction_history")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            List(viewModel.historyFilteredList ?? []) { item in
                TransactionHistoryItem(item: item)
            }
            .listStyle(.plain)
            
            Spacer()
        }.frame(maxWidth: .infinity)
            .overlay(alignment: .bottomTrailing) {
                FabButtonView(resIcon: "ic_filter") {
                    viewModel.isShowingFilter = true
                }
            }
            .sheet(isPresented: $viewModel.isShowingFilter) {
                FilterTransactionView(isShow: $viewModel.isShowingFilter, filterTrans: viewModel.filterTrans) { filter in
                    viewModel.filter(filter)
                }
                .presentationDetents([.height(350)])
            }
    }
}

#Preview {
    TransactionsHistoryView()
}


