//
//  PaymentsView.swift
//  Banking
//
//  Created by Saif on 24/01/2024.
//

import SwiftUI

struct PaymentsView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        ScrollView {
            VStack {
                UserInfoSection(image: "im_person", name: "Saif elislam")
                
                Spacer()
                    .frame(height: 20)
                
                BalanceCardView()
                
                VStack(alignment: .leading) {
                    Button {
                        router.nav(to: .SendMoney)
                    } label: {
                        Image("im_send_money")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                        
                        Text("send-money")
                            .frame(maxWidth: .infinity)
                            .font(.title2)
                            .bold()
                    }
                    .tint(.colorBlue1)
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    
                    SpacerH(height: 22)
                    
                    Text("pay-bills")
                        .foregroundStyle(.white)
                        .font(.title2)
                    
                    HStack(spacing: 20) {
                        BillItemSection(title: "gas", image: "ic_gas") {
                            router.nav(to: .Bils(type: .Gas))
                        }
                        BillItemSection(title: "electricity", image: "ic_elect") {
                            router.nav(to: .Bils(type: .Elect))
                        }
                    }
                    
                    SpacerH(height: 12)
                    
                    HStack(spacing: 20) {
                        BillItemSection(title: "home-net", image: "ic_internet") {
                            router.nav(to: .Bils(type: .Net))
                        }
                        BillItemSection(title: "water", image: "ic_water") {
                            router.nav(to: .Bils(type: .Water))
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top)
                .padding()
                .background(.accent)
                .clipShape(
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: CGFloat(30), topTrailing: CGFloat(30)))
                )
                .shadow(radius: 5, y: -5)
                
                
            }
        }
    }
}

#Preview {
    PaymentsView()
}

private struct BalanceCardView: View {
    var body: some View {
        ZStack {
            Color(.accent)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
            
            VStack(spacing: 18) {
                Text("total-balance")
                    .foregroundStyle(.white)
                    .font(.headline)
                
                Text("15,000 EGP")
                    .font(.largeTitle)
                    .italic()
                    .bold()
                    .foregroundStyle(.white)
                
            }
        }
        .frame(width: 300, height: 150)
        .padding()
        .shadow(radius: 5)

    }
}

struct UserInfoSection: View {
    let image: String
    let name: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                .frame(width: 50, height: 50)
            
            Spacer()
                .frame(width: 20)
            
            VStack(alignment: .leading) {
                Text("welcome")
                Text(name)
                    .bold()
                    .font(.title3)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

struct BillItemSection: View {
    let title: LocalizedStringKey
    let image: String
    let onClick: () ->Void
    
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
            
            Text(title)
                .frame(maxWidth: .infinity)
                .font(.title3)
                .foregroundStyle(.white)
        }
        .padding()
        .background(.colorBlue1)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)))
        .onTapGesture(perform: onClick)
    }
}
