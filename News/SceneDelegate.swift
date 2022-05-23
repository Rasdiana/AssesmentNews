//
//  SceneDelegate.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let model = CategoriesModel()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      model.load()
      let contentView = ContentView()
        .environmentObject(model)
      
      // Use a UIHostingController as window root view controller
      if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
      }
    }
}

