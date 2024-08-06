//
//  AppDelegate.swift
//  GraduationProject
//
//  Created by 1234 on 30/07/2024.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       setRootViewController()
        IQKeyboardManager.shared.enable = true

        customizeNavigationBar()
        return true
    }
    func setLogInRoot(){
        window  = UIWindow(frame: UIScreen.main.bounds)
        let rootController = SignInVC()
        let navigationController = UINavigationController(rootViewController: rootController)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
    private func setRootViewController() {
        window  = UIWindow(frame: UIScreen.main.bounds)
        
//        let rootController = getRootVC()
        let rootController = TapBarVC()
        let navigationController = UINavigationController(rootViewController: rootController)
    
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
    private func getRootVC()->UIViewController{
        guard let isLoggedIn = UserDefaultsManager.share().isLoggedIn else{
            return SignUpVC()
        }
        if isLoggedIn {
            return TapBarVC()
        }
        return SignInVC()
    }
    private func customizeNavigationBar() {
        let backButtonImage = UIImage(named: "black_arrow")?.withRenderingMode(.alwaysTemplate)
                
                // Set global appearance for the back button
                let appearance = UINavigationBar.appearance()
                appearance.backIndicatorImage = backButtonImage
                appearance.backIndicatorTransitionMaskImage = backButtonImage
                appearance.tintColor = UIColor.black // Set the color of the back button

                // Remove the back button title
//                let backButtonAttributes: [NSAttributedString.Key: Any] = [
//                    .foregroundColor: UIColor.clear // Remove the back button title
//                ]
//                UIBarButtonItem.appearance().setTitleTextAttributes(backButtonAttributes, for: .normal)
        }
}

