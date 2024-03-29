//
//  AppDelegate.swift
//  RxSwiftExamples
//
//  Created by tokijh on 2018. 2. 27..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var navigationViewController: UINavigationController = { [unowned self] in
        let navigationViewController = UINavigationController(rootViewController: self.rootViewController)
        return navigationViewController
        }()
    
    lazy var rootViewController: UIViewController = {
        let examplesListViewController = ExamplesListViewController()
        return examplesListViewController
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
