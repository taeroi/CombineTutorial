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
        let dcaRepository: DCARepository = DCARepositoryImpl()
        
        // for pure dependency
        let stockListControllerFactory: () -> StockListController = {
            let usecase = StockUseCase(stockRepository: stockRepository)
            let viewModel = StockListViewModel(usecase: usecase)
            return .init(dependency: .init(viewModel: viewModel))
        }
        
        let stockDetailControllerFactory: (Stock) -> StockDetailController = { stock in
            let usecase : StockDetailUseCase = .init(stockRepository: stockRepository, dcaRepository: dcaRepository)
            let viewModel: StockDetailViewModel = .init(usecase: usecase)
            return .init(dependency: .init(stock: stock, viewModel: viewModel))
        }
        
        let dateSelectControllerFactory: (TimeSeriesMonthlyAdjusted, MonthInfo?) -> DateSelectionController = { timeSeriesMonthlyAdjusted, previousMonthInfo in
            let viewModel: DateSelectionViewModel = .init()
            return .init(dependency: .init(timeSeriesMonthlyAdjusted: timeSeriesMonthlyAdjusted, viewModel: viewModel, selectedMonthInfo: previousMonthInfo))
        }
        
        let mainCoordinator: MainCoordinator = .init(dependency: .init(
                                                        stockListControllerFactory: stockListControllerFactory,
                                                        stockDetailControllerFactory: stockDetailControllerFactory,
                                                        dateSelectionControllerFactory: dateSelectControllerFactory))

        return .init(mainCoordinator: mainCoordinator)
    }
}
