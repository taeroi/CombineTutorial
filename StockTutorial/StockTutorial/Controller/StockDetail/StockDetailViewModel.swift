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
    @Published var timeSeriresMontlyAdjusted: TimeSeriesMonthlyAdjusted?
    @Published var stock: Stock?
    @Published var selectedMonthInfo: MonthInfo?
    @Published var sliderIndex: Int?
    @Published var investmentAmount: Int?
    @Published var monthlyDollarCostAveragingAmount: Int?
    @Published var dcaResult: DCARepositoryImpl.DCAResult?
    
    var timeSeriesMonthlyAdjustedRf: TimeSeriesMonthlyAdjusted?
    var selectedMonthInfoRF: MonthInfo?
    var stockRF: Stock?
    
    let usecase: StockDetailUseCase
    
    init(usecase: StockDetailUseCase) {
        self.usecase = usecase
        super.init()
        bind()
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
            self.timeSeriesMonthlyAdjustedRf = timeSeriresMontlyAdjusted
            if timeSeriresMontlyAdjusted.series.count > 0 {
                self.selectedMonthInfo = timeSeriresMontlyAdjusted.series[0]
            }
        }.store(in: &subscriber)
    }
    
    func bind() {
        $selectedMonthInfo.sink { [unowned self] monthInfo in
            guard let monthInfo = monthInfo else { return}
            self.selectedMonthInfoRF = monthInfo
        }.store(in: &subscriber)
        
        $sliderIndex.sink { index in
            guard let index = index else { return }
            if self.timeSeriesMonthlyAdjustedRf?.series.count ?? 0 > index {
                if let monthInfo = self.timeSeriesMonthlyAdjustedRf?.series[index] {
                    self.selectedMonthInfo = monthInfo
                }
            }
        }.store(in: &subscriber)
        
        $stock.sink { stock in
            guard let stock = stock else { return }
            self.stockRF = stock
        }.store(in: &subscriber)
        
        Publishers.CombineLatest3($selectedMonthInfo, $investmentAmount, $monthlyDollarCostAveragingAmount)
            .sink { [unowned self] selectedMonthInfo, investmentAmount, monthlyDollarCostAveragingAmount in
            guard let selectedMonthInfo = selectedMonthInfo,
                  let investmentAmount = investmentAmount,
                  let monthlyDollarCostAveragingAmount = monthlyDollarCostAveragingAmount else { return }
                self.dcaResult = self.usecase.calculateDCA(initialInvestmentAmount: investmentAmount.doubleValue,
                                                           monthlyDollarCostAveragingAmount: monthlyDollarCostAveragingAmount.doubleValue,
                                                           initialDateOfInvestment: selectedMonthInfo.date)
            }.store(in: &subscriber)
    }
    
   
}

extension StockDetailViewModel: DateSelectionDelegate {
    func dateSelection(index: Int) {
        if let monthInfo = timeSeriesMonthlyAdjustedRf?.series[index] {
            selectedMonthInfo = monthInfo
            sliderIndex = index
        }
    }
}
