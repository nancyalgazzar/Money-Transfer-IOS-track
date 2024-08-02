//
//  AppDelegate.swift
//  GraduationProject
//
//  Created by 1234 on 30/07/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window  = UIWindow(frame: UIScreen.main.bounds)
//        let SignIn = SignInVC()
//        window?.makeKeyAndVisible()
//        window?.rootViewController = SignIn
        
        let homeVC = TapBarVC()
        window?.makeKeyAndVisible()
        window?.rootViewController = homeVC
        return true
    }


}

