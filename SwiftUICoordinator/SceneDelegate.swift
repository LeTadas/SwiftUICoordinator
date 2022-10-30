//
//  SceneDelegate.swift
//  SwiftUICoordinator
//
//  Created by Tadas Legota on 30/10/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            setupNavigation(window)
        }
    }
    
    private func setupNavigation(_ window: UIWindow) {
        let navController = UINavigationController()
        
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
        
        let appNavigator = AppNavigator(navController)
        appNavigator.start()
    }
}

