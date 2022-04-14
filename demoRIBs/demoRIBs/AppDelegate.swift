//
//  AppDelegate.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootRouter: RootRouting!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let rootBuilder = RootBuilder(dependency: AppComponent(window: window!))
        rootRouter = rootBuilder.build()
        rootRouter.interactable.activate()
        rootRouter.load()
        return true
    }
}

