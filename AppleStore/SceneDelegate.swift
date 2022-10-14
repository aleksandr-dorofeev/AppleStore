//
//  SceneDelegate.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 06.10.2022.
//

import UIKit

/// SceneDelegate.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: windowScene)
    if UserStorage.shared.verifyUser(forKey: Constants.inEntry) == false {
      window.rootViewController = OnboardingPageViewController(transitionStyle: .scroll,
                                                               navigationOrientation: .horizontal,
                                                               options: nil)
    } else {
      window.rootViewController = MainTabBarViewController()
    }
    self.window = window
    window.makeKeyAndVisible()
  }
}
