//
//  ContentView.swift
//  Travenor
//
//  Created by Saif on 21/01/2024.
//

import SwiftUI
import LocalAuthentication

struct SplashView: View {
    
    @EnvironmentObject var router: Router
    @State private var isShowingAlert: Bool = false
    @State private var alertMsg: String? {
        didSet {
            if alertMsg != nil {
                isShowingAlert = true
            }
        }
    }
    
    
    var body: some View {
        ZStack {
            Color(.accent)
            
            Text("app-name")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .bold()
            
        }
        .ignoresSafeArea()
        .alert("Error", isPresented: $isShowingAlert, actions: {
            Button("retry") {
                logInWithBiometric()
            }
        }, message: {
            Text(alertMsg ?? "")
        })
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // TODO:  auth.
                logInWithBiometric()
            }
        }
    }
    
    private func logInWithBiometric() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Log In"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) 
            { isSuccess, error in
                DispatchQueue.main.async {
                    if isSuccess {
                        print("Success")
                        router.popAllAndNav(to: .LogIn)
                    } else {
                        if let error = error {
                            print(error)
                            alertMsg = error.localizedDescription
                        }
                    }
                }
            }
        } else {
            // No Biometrics available.
            if let error = error {
                print(error)
                alertMsg = error.localizedDescription
            }
        }
    }
    
}

#Preview {
    SplashView()
}
