//
//  FilterTransactionView.swift
//  Banking
//
//  Created by Saif on 31/01/2024.
//

import Foundation
import SwiftUI

struct FilterTransactionView: View {
    
    @Binding var isShow: Bool
    var filterTrans: TransactionFilterRequest?
    let action: (TransactionFilterRequest?)->Void
    
    @State private var selectedType: Int = TransactionType.send.rawValue
    @State private var selectedDate: Date = Date()
    
    init(isShow: Binding<Bool>, filterTrans: TransactionFilterRequest?,
         action: @escaping (TransactionFilterRequest?) -> Void) {
        self._isShow = isShow
        self.filterTrans = filterTrans
        self.action = action
        
        selectedType = filterTrans?.type?.rawValue ?? TransactionType.send.rawValue
        selectedDate = filterTrans?.date ?? Date()
    }
    
    var body: some View {
        VStack {
            Text("filter")
                .font(.title)
                .bold()
            
            SpacerH(height: 40)
            
            HStack {
                Text("type")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Picker("select-type", selection: $selectedType) {
                    Text("send")
                        .tag(TransactionType.send.rawValue)
                    
                    Text("receive")
                        .tag(TransactionType.receive.rawValue)
                }
                .pickerStyle(.segmented)
            }
            
            SpacerH(height: 32)
            
            DatePicker("select-a-start-date", selection: $selectedDate, displayedComponents: .date)
            
            Spacer()
            
            HStack {
                Button("reset") {
                    action(nil)
                    isShow = false
                }
                .buttonStyle(BaseButtonStyle(bgColor: .colorBlue1))
                .width(120)
                
                Button("filter") {
                    action(TransactionFilterRequest(
                        type: TransactionType(rawValue: selectedType),
                        date: selectedDate
                    ))
                    isShow = false
                }
                .buttonStyle(BaseButtonStyle())
            }
            
        }
        .padding()
    }
    
}

#Preview {
    FilterTransactionView(isShow: .constant(true), filterTrans: TransactionFilterRequest(type: .receive)) { f in
        
    }
}
