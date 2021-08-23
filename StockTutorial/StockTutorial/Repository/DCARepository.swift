//
//  DCARepository.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/24.
//

import Foundation

protocol DCARepository {
    func calculate(initialInvestmentAmount: Double, monthlyDollarCostAveragingAmount: Double, initialDateOfInvestment: Date) -> DCARepositoryImpl.DCAResult
}
