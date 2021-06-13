//
//  SceneDelegate.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            let nvc = BaseNVC()
            window.rootViewController = nvc
            
            let launchCoordinator = Assembly.shared.launchCoordinator(nvc: nvc)
            launchCoordinator.start()
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

