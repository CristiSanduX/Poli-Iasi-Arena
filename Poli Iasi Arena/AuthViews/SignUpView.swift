//
//  SignUpView.swift
//  Poli Iasi Arena
//
//  Created by Cristi Sandu on 30.03.2023.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Poli Iași Arena")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
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
                        self.currentShowingView = "login"
                    }
                }) {
                    Text("Ai deja cont?")
                        .foregroundColor(.black.opacity(0.7))
                }
                Spacer()
                
                Button{
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        if let authResult = authResult {
                            print(authResult.user.uid)
                            userID = authResult.user.uid
                        }
                    }
                    
                } label: {
                    Text("Creează cont nou")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                                .padding(.horizontal)
                        )
                }
                .padding()
            }
        }
    }
}


