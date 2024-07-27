//
//  BillsView.swift
//  Banking
//
//  Created by Saif on 24/01/2024.
//

import SwiftUI

struct BillsView: View {
    
    @StateObject var viewModel = BillsViewModel()
    @State var isShowingSuccessBill = false
    @State var isShowingErrorBill = false
    let billType: BillTypes
    var title: LocalizedStringKey {
        switch billType {
        case .Gas:
            "pay-gas-bill"
        case .Net:
            "pay-net-bill"
        case .Elect:
            "pay-elect-bill"
        case .Water:
            "pay-water-bill"
        }
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                switch billType {
                case .Gas:
                    GasView(number: $viewModel.number)
                case .Net:
                    NetView(number: $viewModel.number)
                case .Elect:
                    ElectView(number: $viewModel.number)
                case .Water:
                    WaterView(number: $viewModel.number)
                }
                
                SpacerH(height: 80)
                
                Button("send") {
                    viewModel.payBill(success: {
                        isShowingSuccessBill = true
                    }, error: {
                        isShowingErrorBill = true
                    })
                }
                .buttonStyle(BaseButtonStyle())
                
            }
            
            if viewModel.isLoading {
                BaseLoadingView()
            }
            
        }
        .alert("success", isPresented: $isShowingSuccessBill, actions: {
            Button("ok") {
                isShowingSuccessBill = false
            }
        }, message: {
            Text("bill-success-msg")
        })
        .alert("error", isPresented: $isShowingErrorBill, actions: {
            Button("ok") {
                isShowingErrorBill = false
            }
        }, message: {
            Text("invalid-num-msg")
        })
        .padding()
        .navigationTitle(title)
    }
}

#Preview {
    BillsView(billType: .Elect)
}

struct GasView: View {
    @Binding var number: String
    var body: some View {
        VStack {
            TextField("phone-number", text: $number)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(InputFieldStyle())
            
        }
    }
}

struct NetView: View {
    @Binding var number: String
    var body: some View {
        VStack {
            TextField("phone-number", text: $number)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(InputFieldStyle())
            
        }
    }
}

struct ElectView: View {
    @Binding var number: String
    var body: some View {
        VStack {
            TextField("phone-number", text: $number)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(InputFieldStyle())
            
        }
    }
}

struct WaterView: View {
    @Binding var number: String
    var body: some View {
        VStack {
            TextField("phone-number", text: $number)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(InputFieldStyle())
            
        }
    }
}
