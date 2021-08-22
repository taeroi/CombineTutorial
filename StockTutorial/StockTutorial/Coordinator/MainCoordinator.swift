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
        let stockDetailControllerFactory: (Stock) -> StockDetailController
    }
    
    var navigationController: UINavigationController?
    
    let rootViewController: StockListController
    let stockDetailControllerFactory: (Stock) -> StockDetailController
    
    required init(dependency: Dependency, payload: ()) {
        rootViewController = dependency.stockListControllerFactory()
        stockDetailControllerFactory = dependency.stockDetailControllerFactory
    }
    
    
    func start() {
        rootViewController.coordinator = self
        navigationController?.setViewControllers([rootViewController], animated: false)
    }
    
    func stockCellTapped(item: Stock) {
        let vc = stockDetailControllerFactory(item)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
