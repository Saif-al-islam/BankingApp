//
//  ExpenseItemView.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import Foundation
import SwiftUI

struct ExpenseItemView : View {
    
    let item: Expense
    
    var body: some View {
        CardView(cornerRadius: 12, shadowY: 2) {
            HStack {
                Image(systemName: item.category.image)
                    .foregroundStyle(.black)
                    .size(70)
                    .background(Circle())
                    .foregroundStyle(.colorBlue1)
                
                SpacerW(width: 18)
                
                VStack(alignment: .leading) {
                    Text(item.category.name)
                        .bold()
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                    Text(item.date)
                        .foregroundStyle(.gray)
                }
                .width(.infinity)
                
                Spacer()
                
                Group {
                    Text("\(String(format: "%.1f", item.price)) ")
                    + Text("egp")
                        .font(.caption)
                        .italic()
                }
                .foregroundStyle(.blue)
                
            }
            
        }
    }
    
}

#Preview {
    ExpenseItemView(item: MockData.expensesList[0])
}
