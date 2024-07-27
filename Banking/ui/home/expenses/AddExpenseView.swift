//
//  AddExpenseView.swift
//  Banking
//
//  Created by Saif on 29/01/2024.
//

import SwiftUI

struct AddExpenseView: View {
    @State var category: Category = Category(id: -1, name: "select", image: "")
    @State var price: String = ""
    @State var description: String = ""
    @State var date: Date = Date()
    
    var categories: [Category]
    let onSave: (Expense)->Void
    
    init(categories: [Category], _ onSave: @escaping (Expense) -> Void) {
        self.categories = categories
        self.onSave = onSave
    }
    
    var body: some View {
        VStack {
            
            Text("add-expense")
                .font(.title2)
                .bold()
            
            Spacer()
                .padding(.top, 0)
                .frame(width: 165, height: 0.5)
                .background(.gray)
            
            SpacerH(height: 30)
            
            HStack {
                Text("category")
                
                Spacer()
                
                Picker("category", selection: $category) {
                    ForEach(categories, id: \.self) { item in
                        Text(item.name)
                    }
                }
                .pickerStyle(.menu)
            }
            
            
            SpacerH(height: 22)
            
            HStack {
                Text("amount")
                Spacer()
                TextField("ex: 12 EGP", text: $price)
                    .textContentType(.shipmentTrackingNumber)
                    .textFieldStyle(InputFieldStyle())
                    .frame(width: 120)
            }
            
            SpacerH(height: 22)
            
            DatePicker("select-a-date",
                       selection: $date,
                       displayedComponents: .date)
            
            
            SpacerH(height: 42)
            
            Button("save") {

                onSave(Expense(id: -1,
                               category: category,
                               description: description,
                               date: Utils.dateFormatter.string(from: date),
                               price: Float(price)!
                              )
                )
            }
            .buttonStyle(BaseButtonStyle())
            .padding(.horizontal, 32)
        }
        .padding()
    }
}

#Preview {
    AddExpenseView(categories: MockData.categoriesList) { expense in
        
    }
}
