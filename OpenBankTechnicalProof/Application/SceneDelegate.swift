//
//  SceneDelegate.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 20/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setupRouter(scene)
    }
}

extension SceneDelegate {
    
    func setupRouter(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        let rootNavigationController = UINavigationController()
        let charactersListRouter = CharactersListRouter()
        
        charactersListRouter.navigationController = rootNavigationController
        charactersListRouter.pushOnNavigationController()
        
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
    }
}
