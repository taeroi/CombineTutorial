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
        
        let stockRepository: StockRepository = SotckRepositoryImpl()
        
        // for pure dependency
        let stockListControllerFactory: () -> StockListController = {
            let usecase = StockUseCase(stockRepository: stockRepository)
            let viewModel = StockListViewModel(usecase: usecase)
            return .init(dependency: .init(viewModel: viewModel))
        }
        
        let mainCoordinator: MainCoordinator = .init(dependency: .init(stockListControllerFactory: stockListControllerFactory))

        return .init(mainCoordinator: mainCoordinator)
    }
}
