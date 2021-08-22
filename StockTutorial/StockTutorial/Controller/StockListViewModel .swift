//
//  StockListViewModel.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/20.
//

import RxSwift
import Combine

class StockListViewModel {
    //----- Rx -----
//    var loading: BehaviorSubject<Bool> = .init(value: false)
//    var errorMessage: BehaviorSubject<String?> = .init(value: nil)
//    var stocks: BehaviorSubject<[Stock]> = .init(value: [])
    
    //----- Combine -----
    @Published var stocks: [Stock] = []
    @Published var errorMessage: String?
    @Published var loading = false
    @Published var isEmpty = false
    var currentStocks: [Stock] = []
    
    var subscriber: Set<AnyCancellable> = .init()
    let usecase: StockUseCase
    
    func searchQueryChanged(query: String) {
        loading = true
        usecase.fetchStocksPublisher(keywords: query).sink { [unowned self] completion in
            self.loading = false
            switch completion {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .finished:
                break
            }
        } receiveValue: { stockResult in
            self.currentStocks = stockResult.items
            self.stocks = stockResult.items
        }.store(in: &subscriber)

    }
    
    init(usecase: StockUseCase) {
        self.usecase = usecase
        reduce()
    }
    
    func reduce() {
        $stocks.sink { [unowned self] stocks in
            if stocks.count == 0 {
                self.isEmpty = true
            } else {
                self.isEmpty = false
            }
        }.store(in: &subscriber)
    }
    
    
}
