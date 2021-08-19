//
//  StockUseCase.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/20.
//

import Foundation
import Combine

class StockUseCase {
    
    func fetchStocksPublisher(keywords: String) -> AnyPublisher<StockResult, Error> {
        return stockRepository.fetchStocksPublisher(keywords: keywords)
    }
    
    private let stockRepository: StockRepository
    
    init(stockRepository: StockRepository) {
        self.stockRepository = stockRepository
    }
}
