//
//  Poli_Iasi_ArenaApp.swift
//  Poli Iasi Arena
//
//  Created by Cristi Sandu on 30.03.2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Poli_Iasi_ArenaApp: App {
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
