//
//  MainCoordinator.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func start() {
       let rootViewController = StockListViewController()
        navigationController?.setViewControllers([rootViewController], animated: false)
    }
    
}
