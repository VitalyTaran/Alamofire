//
//  AppDelegate.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 07.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = CharactersViewController()
        let navController = UINavigationController(rootViewController: rootVC)
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}


