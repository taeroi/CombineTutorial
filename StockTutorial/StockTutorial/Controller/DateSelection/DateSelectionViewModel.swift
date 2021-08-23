//
//  DateSelectionViewModel.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/23.
//

import Combine

final class DateSelectionViewModel: BaseViewModel {
    
    @Published var timeSeriesMonthlyAdjusted: TimeSeriesMonthlyAdjusted?
    @Published var monthInfos: [MonthInfo] = []
    var monthInfosRf: [MonthInfo] = []
    
    func timeSeriesMonthlyAdjustedChanged(timeSeriesMonthlyAdjusted: TimeSeriesMonthlyAdjusted) {
        self.timeSeriesMonthlyAdjusted = timeSeriesMonthlyAdjusted
    }
    
    override init() {
        super.init()
        bind()
    }
    
    func bind() {
        $timeSeriesMonthlyAdjusted.sink { [unowned self] timeSeriesMonthlyAdjusted in
            guard let timeSeriesMonthlyAdjusted = timeSeriesMonthlyAdjusted else { return }
            self.monthInfosRf = timeSeriesMonthlyAdjusted.series
            self.monthInfos = timeSeriesMonthlyAdjusted.series
        }.store(in: &subscriber)
    }
}

