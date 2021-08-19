//
//  StockListViewModel.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/20.
//

import RxSwift
import Combine

class StockListViewModel {
    var loading: BehaviorSubject<Bool> = .init(value: false)
    var errorMessage: BehaviorSubject<String?> = .init(value: nil)
    var stocks: BehaviorSubject<[Stock]> = .init(value: [])
    var subscriber: Set<AnyCancellable> = .init()
    
    let usecase: StockUseCase
    
    init(usecase: StockUseCase) {
        self.usecase = usecase
    }
    
    func viewDidLoad() {
        loading.onNext(true)
        usecase.fetchStocksPublisher(keywords: "apple").sink { completion in
            self.loading.onNext(false)
            switch completion {
            case .failure(let error):
                self.errorMessage.onNext(error.localizedDescription)
            case .finished: break
            }
        } receiveValue: { stockResult in
            self.loading.onNext(false)
            self.stocks.onNext(stockResult.items)
        }
        .store(in: &subscriber)

    }
}
