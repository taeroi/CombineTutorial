//
//  TimeSeriesMontlyAdjusted.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import Foundation

struct TimeSeriesMontlyAdjusted: Decodable {
    let meta: Meta
    let series: [String: OHLC]
    
    enum CodingKeys: String, CodingKey {
        case meta = "Meta Data"
        case series = "Monthly Adjusted Time Series"
    }
    
    struct Meta: Decodable {
        let symbol: String
        
        enum CodingKeys: String, CodingKey {
            case symbol = "2. Symbol"
        }
    }
    
    struct OHLC: Decodable {
        let open: String
        let close: String
        let adjustedClose: String
        
        enum CodingKeys: String, CodingKey {
            case open = "1. open"
            case close = "4. close"
            case adjustedClose = "5. adjusted close"
        }
    }
}
