//
//  Coordinator.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit

class Coordinator {
    
    func start(window: UIWindow, rootViewController: UIViewController) {
        let rootViewController = UINavigationController(rootViewController: rootViewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
