//
//  AppDelegate.swift
//  iOSTemplateApp
//
//  Created by 한상진 on 2021/06/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let vc: ViewController = .init(nibName: nil, bundle: nil)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}

