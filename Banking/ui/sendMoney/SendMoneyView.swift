//
//  sendMoneyView.swift
//  Banking
//
//  Created by Saif on 24/01/2024.
//

import SwiftUI

struct SendMoneyView: View {
    @StateObject private var viewModel = SendMoneyViewModel()
    @State var selectedTab: Int = 0
    @State var isShowingSuccessMoneySent = false
    @State var isShowingErrorMoneySent = false
    
    var body: some View {
        ZStack {
            VStack {
                Picker("", selection: $selectedTab) {
                    Text("phone")
                        .tag(0)
                    
                    Text("card")
                        .tag(1)
                    
                    Text("bank-account")
                        .tag(2)
                    
                }
                .pickerStyle(.segmented)
                .padding()
                
                SpacerH(height: 60)
                
                switch selectedTab {
                case 0 :
                    PhoneView(phone: $viewModel.phone)
                case 1 :
                    CardNumView(cardNum: $viewModel.cardNum, cardName: $viewModel.cardName)
                default :
                    AccountNumView(accountNum: $viewModel.accountNum)
                }
                
                SpacerH(height: 20)
                
                TextField("amount", text: $viewModel.amount)
                    .keyboardType(.numberPad)
                    .textFieldStyle(InputFieldStyle())
                
                SpacerH(height: 80)
                
                Button("send") {
                    viewModel.sendMoney(selectedTab: selectedTab, success: {
                        isShowingSuccessMoneySent = true
                    }, error: {
                        isShowingErrorMoneySent = true
                    })
                }
                .buttonStyle(BaseButtonStyle())
                
                Spacer()
                
            }
            
            if viewModel.isLoading {
                BaseLoadingView()
            }
        }
        .alert("success", isPresented: $isShowingSuccessMoneySent, actions: {
            Button("ok") {
                isShowingSuccessMoneySent = false
            }
        }, message: {
            
            Text("money-sent-success-msg")
        })
        .alert("error", isPresented: $isShowingErrorMoneySent, actions: {
            Button("ok") {
                isShowingErrorMoneySent = false
            }
        }, message: {
            Text("invalid-num-msg")
        })
        .padding()
        .navigationTitle("send-money")
        
    }
    
}

#Preview {
    SendMoneyView()
}

struct PhoneView: View {
    @Binding var phone: String
    
    var body: some View {
        VStack {
            TextField("phone-number", text: $phone)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(InputFieldStyle())
        }
    }
}

struct CardNumView: View {
    @Binding var cardNum: String
    @Binding var cardName: String
    
    
    var body: some View {
        VStack {
            TextField("card-num", text: $cardNum)
                .textContentType(.creditCardNumber)
                .keyboardType(.numberPad)
                .textFieldStyle(InputFieldStyle())
            
            SpacerH(height: 20)
            
            TextField("card-name", text: $cardName)
                .textContentType(.name)
                .textFieldStyle(InputFieldStyle())
        }
    }
}

struct AccountNumView: View {
    @Binding var accountNum: String
    
    var body: some View {
        VStack {
            TextField("bank-account-num", text: $accountNum)
                .textContentType(.creditCardNumber)
                .keyboardType(.numberPad)
                .textFieldStyle(InputFieldStyle())
            
        }
    }
}
