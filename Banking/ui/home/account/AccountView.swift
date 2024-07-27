//
//  AccountView.swift
//  Banking
//
//  Created by Saif on 24/01/2024.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.user?.imageUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("im_person")
                    .resizable()
            }
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .size(120)
            
            SpacerH(height: 30)
            
            Text(viewModel.user?.name ?? "")
                .font(.title2)
            
            SpacerH(height: 50)
            
            Text("contact-details")
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
            
            SpacerH(height: 30)
            
            LabeledContent("phone-number", value: viewModel.user?.phoneNumber ?? "")
                .padding(.horizontal)
            
            Divider()
                .padding(.top)
            
            LabeledContent("customer-id", value: "asda8s7d9a8")
                .padding(.horizontal)
            
            Divider()
                .padding(.top)
             
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AccountView()
}
