//
//  StockRepository.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import Combine

protocol StockRepository {
    func fetchStocksPublisher(keywords: String) -> AnyPublisher<StockResult, Error>
    func fetchTimeSeriesPublisher(keywords: String) -> AnyPublisher<TimeSeriesMontlyAdjusted, Error>
}
