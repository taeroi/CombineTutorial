//
//  StockDetailUseCase.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import Combine
import Foundation

class StockDetailUseCase {
    
    func fetchTimeSeriesPublisher(keywords: String) -> AnyPublisher<TimeSeriesMonthlyAdjusted, Error> {
        return stockRepositroy.fetchTimeSeriesPublisher(keywords: keywords)
    }
    
    func calculateDCA(initialInvestmentAmount: Double, monthlyDollarCostAveragingAmount: Double, initialDateOfInvestment: Date) -> DCARepositoryImpl.DCAResult {
        return dcaRepository.calculate(initialInvestmentAmount: initialInvestmentAmount,
                                       monthlyDollarCostAveragingAmount: monthlyDollarCostAveragingAmount,
                                       initialDateOfInvestment: initialDateOfInvestment)
    }
    private let stockRepositroy: StockRepository
    private let dcaRepository: DCARepository
    
    init(stockRepository: StockRepository, dcaRepository: DCARepository) {
        self.stockRepositroy = stockRepository
        self.dcaRepository = dcaRepository

    }
}
