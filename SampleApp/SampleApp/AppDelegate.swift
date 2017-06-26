//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Tsuyoshi Tokuda on 2017/06/26.
//  Copyright © 2017 Tsuyoshi Tokuda. All rights reserved.
//

import UIKit

typealias LaunchOptions = [UIApplicationLaunchOptionsKey: Any]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    fileprivate let window: UIWindow = .init()

    let rootViewCtrl: ViewController = .init()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptions?) -> Bool {
        configureWindow()

        return true
    }
}

// MARK: - Private methods

private extension AppDelegate {

    func configureWindow() {
        window.rootViewController = rootViewCtrl
        window.makeKeyAndVisible()
    }
}
