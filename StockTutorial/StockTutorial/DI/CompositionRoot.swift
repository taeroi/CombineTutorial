//
//  CompositionRoot.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

struct AppDependency {
    let mainCoordinator: MainCoordinator
}

extension AppDependency {
    
    static func resolve() -> AppDependency {
        
        let stockRepository: StockRepository = StockRepositoryImpl()
        
        // for pure dependency
        let stockListControllerFactory: () -> StockListController = {
            let usecase = StockUseCase(stockRepository: stockRepository)
            let viewModel = StockListViewModel(usecase: usecase)
            return .init(dependency: .init(viewModel: viewModel))
        }
        
        let stockDetailControllerFactory: (Stock) -> StockDetailController = { stock in
            return .init(dependency: .init(stock: stock))
            
        }
        
        let mainCoordinator: MainCoordinator = .init(dependency: .init(
                                                        stockListControllerFactory: stockListControllerFactory, stockDetailControllerFactory: stockDetailControllerFactory))

        return .init(mainCoordinator: mainCoordinator)
    }
}
