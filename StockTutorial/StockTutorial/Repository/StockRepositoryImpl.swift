//
//  SotckRepositoryImpl.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import Combine
import Foundation

/// 구현체
class StockRepositoryImpl: StockRepository {
    
    enum StockRepositoryError: Error {
        case encoding
        case badUrl
    }
    let apiKey: String = "11LMTU6DRYEESBO0"
    let decorder = JSONDecoder()
    
    func fetchStocksPublisher(keywords: String) -> AnyPublisher<StockResult, Error> {
        guard let keywords = keywords.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            let error: StockRepositoryError = .encoding
            return Fail(error: error).eraseToAnyPublisher()
        }
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            let error: StockRepositoryError = .badUrl
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data }
            .decode(type: StockResult.self, decoder: decorder)
            .receive(on: RunLoop.main).eraseToAnyPublisher()
    }
    
    
}
