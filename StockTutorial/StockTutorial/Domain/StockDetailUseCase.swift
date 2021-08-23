//
//  StockDetailUseCase.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import Combine

class StockDetailUseCase {
    
    func fetchTimeSeriesPublisher(keywords: String) -> AnyPublisher<TimeSeriesMonthlyAdjusted, Error> {
        return stockRepositroy.fetchTimeSeriesPublisher(keywords: keywords)
    }

    private let stockRepositroy: StockRepository
    
    init(stockRepository: StockRepository) {
        self.stockRepositroy = stockRepository
    }
}
