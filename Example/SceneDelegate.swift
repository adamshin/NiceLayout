//
//  SceneDelegate.swift
//  NiceLayout
//
//  Created by Adam Shin on 3/1/20.
//  Copyright © 2020 Adam Shin. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
    }
    
}
