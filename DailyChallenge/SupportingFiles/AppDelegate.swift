//
//  AppDelegate.swift
//  DailyChallenge
//
//  Created by Roman Zhukov on 20.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = GreetingsViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

