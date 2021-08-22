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
    
    let usecase: StockDetailUseCase
    
    init(usecase: StockDetailUseCase) {
        self.usecase = usecase
        super.init()
    }
    
    func viewDidLoad(symbol: String) {
        usecase.fetchTimeSeriesPublisher(keywords: symbol).sink { [unowned self] completion in
            switch completion {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .finished: break
            }
        } receiveValue: { value in
            self.timeSeriresMontlyAdjusted = value
        }.store(in: &subscriber)
    }
}
