//
//  AppDelegate.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
    
}
