//
//  BaseViewModel.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import Foundation
import Combine

class BaseViewModel {
    var subscriber: Set<AnyCancellable> = .init()
    
    init() {
        subscriber = .init()
    }
}
