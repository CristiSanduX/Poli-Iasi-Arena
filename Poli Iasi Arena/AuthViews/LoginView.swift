//
//  LoginView.swift
//  Poli Iasi Arena
//
//  Created by Cristi Sandu on 30.03.2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @Binding var currentShowingView: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Poli Iași Arena")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                    .padding()
                Spacer()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100,alignment: .center)
                    .padding()
                HStack {
                    Image(systemName: "mail")
                        .foregroundColor(.black)
                    TextField("E-mail",text: $email)
                        .foregroundColor(Color.black)
                    Spacer()
                    if (email.count != 0) {
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding()
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.black)
                    SecureField("Parolă",text: $password)
                        .foregroundColor(Color.black)
                    Spacer()
                    if (password.count != 0) {
                        Image(systemName: password.isValidPassword() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(password.isValidPassword() ? .green : .red)
                        
                    }
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding()
                
                
                
                Button(action: {
                    withAnimation{
                        self.currentShowingView = "signup"
                    }
                }) {
                    Text("Nu ai cont?")
                        .foregroundColor(.blue.opacity(0.7))
                }
                Spacer()
                
                Button{
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        if let authResult = authResult {
                            print(authResult.user.uid)
                        }
                        
                    }
                } label: {
                    Text("Autentifică-te")
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                                .padding(.horizontal)
                        )
                }
                .padding()
            }
        }
    }
}


