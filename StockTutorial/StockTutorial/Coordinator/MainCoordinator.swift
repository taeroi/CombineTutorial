//
//  MainCoordinator.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit
import Pure

class MainCoordinator: Coordinator, FactoryModule {
    
    struct Dependency {
        let stockListControllerFactory: () -> StockListController
    }
    
    var navigationController: UINavigationController?
    let rootViewController: StockListController
    
    required init(dependency: Dependency, payload: ()) {
        rootViewController = dependency.stockListControllerFactory()
    }
    
    
    func start() {
        navigationController?.setViewControllers([rootViewController], animated: false)
    }
    
}
