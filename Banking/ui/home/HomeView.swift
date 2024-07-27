//
//  HomeView.swift
//  Travenor
//
//  Created by Saif on 23/01/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            TabView {
                PaymentsView()
                    .tabItem {
                        Label("payments", image: "ic_money_fill")
                    }
                
                ExpensesView()
                    .tabItem {
                        Label("expenses", image: "ic_wallet")
                    }
                
                TransactionsHistoryView()
                    .tabItem {
                        Label("transactions", image: "ic_history")
                    }
                
                AccountView()
                    .tabItem {
                        Label("account", systemImage: "person.crop.circle.fill")
                    }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    HomeView()
}
