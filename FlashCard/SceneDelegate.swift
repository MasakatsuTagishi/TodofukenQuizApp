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
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

}

