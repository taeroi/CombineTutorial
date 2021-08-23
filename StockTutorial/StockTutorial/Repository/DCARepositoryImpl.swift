//
//  DCARepositoryImpl.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/24.
//

import Foundation

final class DCARepositoryImpl: DCARepository {
    
    struct DCAResult {
        let currentValue: Double
        let investmentAmount: Double
        let gain: Double
        let yield: Double
        let annualReturn: Double
    }
    
    func calculate(initialInvestmentAmount: Double, monthlyDollarCostAveragingAmount: Double, initialDateOfInvestment: Date) -> DCARepositoryImpl.DCAResult {
        return .init(currentValue: 0,
                     investmentAmount: 0,
                     gain: 0,
                     yield: 0,
                     annualReturn: 0)
    }

}
