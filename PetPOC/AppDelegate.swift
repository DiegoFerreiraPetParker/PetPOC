//
//  AppDelegate.swift
//  PetPOC
//
//  Created by Diego Ferreira on 06/07/22.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange //.systemBackground
        window?.rootViewController = UINavigationController(rootViewController: loginViewController)
        
        FirebaseApp.configure()
        
        return true
    }
}

