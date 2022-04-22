//
//  SceneDelegate.swift
//  MyFriends-MVVM-table&collectionView
//
//  Created by Бексултан Нурпейс on 17.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = creatTabBar()
        window?.makeKeyAndVisible()
    }

    func creatFeedNC() -> UINavigationController{
        let myFeedVC = myFeedViewController()
        myFeedVC.title = "My Feed".localized()
        myFeedVC.tabBarItem = UITabBarItem(
            title: "My Feed".localized(),
            image: UIImage(systemName: "photo"),
            tag: 0
        )
        
        return UINavigationController(rootViewController: myFeedVC)
    }
    
    func creatFriendsNC() -> UINavigationController{
        let myFriendsVC = myFriendsViewController()
        myFriendsVC.title = "My Friends".localized()
        myFriendsVC.tabBarItem = UITabBarItem(
            title: "My Friends".localized(),
            image: UIImage(systemName: "person"),
            tag: 1
        )
        
        return UINavigationController(rootViewController: myFriendsVC)
    }
    
    func creatPinsNC() -> UINavigationController{
        let myPinsVC = myPinsViewController()
        myPinsVC.title = "My Pins".localized()
        myPinsVC.tabBarItem = UITabBarItem(
            title: "My Pins".localized(),
            image: UIImage(systemName: "map"),
            tag: 2
        )
        
        return UINavigationController(rootViewController: myPinsVC)
    }
    
    func creatProfileNC() -> UINavigationController{
        let myProfileVC = myProfileViewController()
        myProfileVC.title = "My Profile".localized()
        myProfileVC.tabBarItem = UITabBarItem(
            title: "My Profile".localized(),
            image: UIImage(systemName: "house"),
            tag: 3
        )
        
        return UINavigationController(rootViewController: myProfileVC)
    }
    
    func creatTabBar() -> UITabBarController{
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().barTintColor = .systemGray6
        tabbar.viewControllers = [
            creatFeedNC(),
            creatFriendsNC(),
            creatPinsNC(),
            creatProfileNC()
        ]
        return tabbar
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

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

