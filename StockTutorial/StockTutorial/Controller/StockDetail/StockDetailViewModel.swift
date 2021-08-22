//
//  StockDetailViewModel.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import Combine

class StockDetailViewModel: BaseViewModel {
    @Published var loading = false
    @Published var errorMessage: String?
    @Published var timeSeriresMontlyAdjusted: TimeSeriesMontlyAdjusted?
    @Published var stock: Stock?
    
    let usecase: StockDetailUseCase
    
    init(usecase: StockDetailUseCase) {
        self.usecase = usecase
        super.init()
    }
    
    func viewDidLoad(symbol: String, stock: Stock) {
        loading = true
        self.stock = stock
        usecase.fetchTimeSeriesPublisher(keywords: symbol).sink { [unowned self] completion in
            loading = false
            switch completion {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .finished: break
            }
        } receiveValue: { value in
            var timeSeriresMontlyAdjusted = value
            timeSeriresMontlyAdjusted.generateMonthInfos()
            self.timeSeriresMontlyAdjusted = timeSeriresMontlyAdjusted
        }.store(in: &subscriber)
    }
    
   
}
