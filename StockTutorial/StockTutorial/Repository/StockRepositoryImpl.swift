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
    
    private let baseUrl: String = "https://www.alphavantage.co/query?"
    let apiKey: String = "11LMTU6DRYEESBO0"
    let decorder = JSONDecoder()
    
    
    func fetchStocksPublisher(keywords: String) -> AnyPublisher<StockResult, Error> {
        
        let queryResult = parseQueryString(text: keywords)
        var query: String = ""
        
        switch queryResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let value):
            query = value
        }
        
        let urlResult = parseUrl(urlString: "\(baseUrl)function=SYMBOL_SEARCH&keywords=\(query)&apikey=\(apiKey)")
        
        switch urlResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let url):
            return URLSession.shared.dataTaskPublisher(for: url)
                .map{ $0.data }
                .decode(type: StockResult.self, decoder: decorder)
                .receive(on: RunLoop.main).eraseToAnyPublisher()
        }
    }
    
    
    func fetchTimeSeriesPublisher(keywords: String) -> AnyPublisher<TimeSeriesMontlyAdjusted, Error> {
        let queryResult = parseQueryString(text: keywords)
        var query: String = ""
        
        switch queryResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let value):
            query = value
        }
        
        let urlResult = parseUrl(urlString: "\(baseUrl)function=TIME_SERIES_MONTHLY_ADJUSTED&symbol=\(query)&apikey=\(apiKey)")
        
        switch urlResult {
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        case .success(let url):
            return URLSession.shared.dataTaskPublisher(for: url).map{ $0.data }
                .decode(type: TimeSeriesMontlyAdjusted.self, decoder: decorder)
                .receive(on: RunLoop.main).eraseToAnyPublisher()
        }
    }
    
    
    //----- Error Case -----
    enum StockRepositoryError: Error {
        case encoding
        case badUrl
    }
    
    /// UrlString을 파싱하는 메서드입니다.
    ///
    ///인자로 UrlString을 받고 결과로 Result(URL / Error)를 반환합니다
    private func parseUrl(urlString: String) -> Result<URL, Error> {
        if let url = URL(string: urlString) {
            return .success(url)
        } else {
            let error: StockRepositoryError = .badUrl
            return .failure(error)
        }
    }
    
    /// Query String을 파싱하는 메서드입니다.
    ///
    /// 인자로 text를 받아 인코딩하여 성공시 인코딩된 String을 반환합니다.
    private func parseQueryString(text: String) -> Result<String, Error> {
        if let query = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            return .success(query)
        } else {
            let error: StockRepositoryError = .encoding
            return .failure(error)
        }
    }
    
    
}
