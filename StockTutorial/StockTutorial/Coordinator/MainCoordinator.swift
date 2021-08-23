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
        let dateSelectionControllerFactory: (TimeSeriesMonthlyAdjusted, MonthInfo?) -> DateSelectionController
    }
    
    var navigationController: UINavigationController?
    
    let rootViewController: StockListController
    let stockDetailControllerFactory: (Stock) -> StockDetailController
    let dateSelectionControllerFactory: (TimeSeriesMonthlyAdjusted, MonthInfo?) -> DateSelectionController
    
    var stockDetailControllerRF: StockDetailController?
    
    required init(dependency: Dependency, payload: ()) {
        rootViewController = dependency.stockListControllerFactory()
        stockDetailControllerFactory = dependency.stockDetailControllerFactory
        dateSelectionControllerFactory = dependency.dateSelectionControllerFactory
    }
    
    
    func start() {
        rootViewController.coordinator = self
        navigationController?.setViewControllers([rootViewController], animated: false)
    }
    
    func stockCellTapped(item: Stock) {
        let controller = stockDetailControllerFactory(item)
        stockDetailControllerRF = controller
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func dateInputTextFieldTapped(with timeSeriesMonthlyAdjusted: TimeSeriesMonthlyAdjusted, monthInfo: MonthInfo?) {
        let controller = dateSelectionControllerFactory(timeSeriesMonthlyAdjusted, monthInfo)
        controller.delegate = stockDetailControllerRF?.viewModel
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
}
