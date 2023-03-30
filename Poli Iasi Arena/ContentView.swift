//
//  ContentView.swift
//  Poli Iasi Arena
//
//  Created by Cristi Sandu on 30.03.2023.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @AppStorage("uid") var userID: String = ""
    
    
    var body: some View {
        if userID == "" {
            AuthView()
        }
        else {
            Text("Logged in!\n Your user ID is \(userID)")
            Button(action: {
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    withAnimation{
                        userID = ""
                    }
                   
                } catch let signOutError as NSError {
                    print("Error signing out: %@",signOutError)
                }
                
            })
            {
                Text("Sign out")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
