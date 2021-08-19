//
//  SotckRepositoryImpl.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import Combine
import Foundation

/// 구현체
class SotckRepositoryImpl: StockRepository {
    let apiKey: String = "11LMTU6DRYEESBO0"
    let decorder = JSONDecoder()
    
    func fetchStocksPublisher(keywords: String) -> AnyPublisher<StockResult, Error> {
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(apiKey)"
        
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: StockResult.self, decoder: decorder)
            .receive(on: RunLoop.main).eraseToAnyPublisher()
    }
}
