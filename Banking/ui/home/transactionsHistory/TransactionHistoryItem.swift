//
//  TransactionHistoryItem.swift
//  Banking
//
//  Created by Saif on 30/01/2024.
//

import Foundation
import SwiftUI

struct TransactionHistoryItem : View {
    let item: Transaction
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.otherUser.imageUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
            } placeholder: {
                Image("im_person")
                    .resizable()
                    .clipShape(Circle())
            }
            .size(60)
            
            SpacerW(width: 18)
            
            VStack(alignment: .leading) {
                Text(item.otherUser.name)
                    .bold()
                    .font(.subheadline)
                    .foregroundStyle(.black)
                
                SpacerH(height: 8)
                
                HStack {
                    Text(item.type == .send ? "send" : "receive")
                        .foregroundStyle(.colorGray3)
                        .font(.subheadline)
                        
                    Circle()
                        .foregroundStyle(.colorGray2)
                        .size(6)
                    
                    Text(item.date)
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                }
            }
            .width(.infinity)
            
            Spacer()
            
            Group {
                Text((item.type == .send) ? "-" : "+")
                + Text("\(String(format: "%.1f", item.amount)) ")
                + Text("egp")
                    .font(.caption)
                    .italic()
            }
            .foregroundStyle(item.type == .send ? .black : .green)
            
        }
        
    }
}

#Preview {
    TransactionHistoryItem(item: MockData.transactionsList[1])
}

