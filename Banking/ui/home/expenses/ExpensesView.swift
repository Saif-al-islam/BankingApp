//
//  ExpensesView.swift
//  Banking
//
//  Created by Saif on 24/01/2024.
//

import SwiftUI

struct ExpensesView: View {
    @StateObject private var viewModel = ExpensesViewModel()
    
    
    var body: some View {
        VStack {
            TotalExpensesSection(totalExpenses: viewModel.totalExpenses)
            
            SpacerH(height: 32)
            
            FilterSection(
                categories: viewModel.categories ?? [],
                selectedCategory: $viewModel.selectedCategory,
                selectedDate: $viewModel.selectedDate
            ) {
                viewModel.resetFilter()
            }
            
            SpacerH(height: 32)
            
            List(viewModel.expenses ?? []) { item in
                ExpenseItemView(item: item)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .bottomTrailing) {
            FabButtonView(systemIcon: "plus") {
                viewModel.isShowingAddExpense = true
            }
        }
        .sheet(isPresented: $viewModel.isShowingEditBalance) {
            EditBalanceView()
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $viewModel.isShowingAddExpense) {
            AddExpenseView(categories: viewModel.categories ?? []) { expense in
                viewModel.isShowingAddExpense = false
                viewModel.addExpense(expense)
            }
            .presentationDetents([.medium])
        }
    }
    
}



#Preview {
    ExpensesView()
}

private struct TotalExpensesSection: View {
    let totalExpenses: Int
    
    var body: some View {
        VStack {
            Text("\(totalExpenses)  ")
                .font(.headline)
                .bold()
            + Text("egp")
                .font(.caption)
                .italic()
            
            HStack {
                Text("total-expenses")
                    .font(.subheadline)
                
                //                Text(Image(systemName: "chevron.down"))
            }.foregroundStyle(.gray)
        }
    }
}


struct FilterSection: View {
    @State private var isShowingDatePicker = false
    let categories: [Category]
    @Binding var selectedCategory: String
    @Binding var selectedDate: String
    @State private var date: Date = Date() {
        didSet {
            selectedDate = Utils.dateFormatter.string(from: date)
        }
    }
    let resetAction: ()->Void

    var body: some View {
        HStack {
            Text("filter-by")
                .font(.headline)
            
            SpacerW(width: 10)
            
            Menu(content:  {
                ForEach(categories, id: \.id) { item in
                    Button(item.name) {
                        selectedCategory = item.name
                    }
                }
            }, label: {
                FilterChipItem(title: selectedCategory.isEmpty ? "category" : "\(selectedCategory)")
            })
            
            
            if !isShowingDatePicker {
                FilterChipItem(title: "date")
                    .onTapGesture {
                        isShowingDatePicker = true
                    }
            } else {
                DatePicker("date",
                           selection: $date,
                           displayedComponents: .date)
                .labelsHidden()
                .background(RoundedRectangle(cornerRadius: 12))
                .foregroundStyle(.colorBlue1)
            }
            
            Spacer()
            
            Text("reset")
                .bold()
                .font(.caption)
                .foregroundStyle(.colorBlue1)
                .onTapGesture {
                    selectedCategory = ""
                    selectedDate = ""
                    date = Date()
                    isShowingDatePicker = false
                    resetAction()
                }
            
        }
        .padding(.horizontal)
    }
}

