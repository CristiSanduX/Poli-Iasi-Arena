//
//  AuthView.swift
//  Poli Iasi Arena
//
//  Created by Cristi Sandu on 30.03.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var currentViewShowing: String = "login"
    
    var body: some View {
        if (currentViewShowing == "login") {
            LoginView(currentShowingView: $currentViewShowing)
                .transition(.scale)
        }
        else {
            SignUpView(currentShowingView: $currentViewShowing)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

