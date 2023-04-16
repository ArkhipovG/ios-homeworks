//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        
        let tabBarController = UITabBarController()
        let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
        let logInNavigationController = UINavigationController(rootViewController: LogInViewController())
        tabBarController.setViewControllers([feedNavigationController, logInNavigationController], animated: true)
        feedNavigationController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "newspaper"), selectedImage: nil)
        logInNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), selectedImage: nil)
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}

func sceneDidDisconnect(_ scene: UIScene) {
}

func sceneDidBecomeActive(_ scene: UIScene) {
}

func sceneWillResignActive(_ scene: UIScene) {
}

func sceneWillEnterForeground(_ scene: UIScene) {
}

func sceneDidEnterBackground(_ scene: UIScene) {
}




