//
//  SceneDelegate.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/08/24.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    let keyChain = Keychain()
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let loginId = try? keyChain.get("uid")
        
        if loginId != nil {
            
            let window = UIWindow(windowScene: scene as! UIWindowScene)
            self.window = window
            window.makeKeyAndVisible()
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let tabVC = storyBoard.instantiateViewController(identifier: "tabVC")
            let navVC = UINavigationController(rootViewController: tabVC)
            window.rootViewController = navVC
            
        } else {
            
            let window = UIWindow(windowScene: scene as! UIWindowScene)
            self.window = window
            window.makeKeyAndVisible()
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let tabVC = storyBoard.instantiateViewController(identifier: "loginVC")
            let navVC = UINavigationController(rootViewController: tabVC)
            window.rootViewController = navVC
            
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
}

