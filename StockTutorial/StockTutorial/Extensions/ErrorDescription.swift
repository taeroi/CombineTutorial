//
//  ErrorDescription.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import Foundation

public enum CustomError: Error {
    case badResponse
    case badUrl
    case encoding
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badResponse: return "네트워크 상태가 좋지 않습니다"
        case .badUrl: return "유효하지 않은 url 입니다"
        case .encoding: return "인코딩에 실패하였습니다"
        }
    }
}
