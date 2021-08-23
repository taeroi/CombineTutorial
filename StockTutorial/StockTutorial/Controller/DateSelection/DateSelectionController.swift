//
//  DateSelectionController.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit
import Pure
import Combine

protocol DateSelectionDelegate: AnyObject {
    func dateSelection(index: Int)
}

class DateSelectionController: UITableViewController, FactoryModule {
    
    struct Dependency {
        let timeSeriesMonthlyAdjusted: TimeSeriesMonthlyAdjusted
        let viewModel: DateSelectionViewModel
        let selectedMonthInfo: MonthInfo?
    }
    
    let timeSeriesMonthlyAdjusted: TimeSeriesMonthlyAdjusted
    let viewModel: DateSelectionViewModel
    let selectedMonthInfo: MonthInfo?
    var subscriber: Set<AnyCancellable> = .init()
    var delegate: DateSelectionDelegate?
    var coordinator: MainCoordinator?
    
    required init(dependency: Dependency, payload: ()) {
        timeSeriesMonthlyAdjusted = dependency.timeSeriesMonthlyAdjusted
        viewModel = dependency.viewModel
        selectedMonthInfo = dependency.selectedMonthInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.register(DateSelectionCell.self, forCellReuseIdentifier: DateSelectionCell.identifer)
        viewModel.timeSeriesMonthlyAdjustedChanged(timeSeriesMonthlyAdjusted: timeSeriesMonthlyAdjusted)
        bind(with: viewModel)
    }
    
    func bind(with viewModel: DateSelectionViewModel) {
        viewModel.$monthInfos.sink { [unowned self]_ in
            self.tableView.reloadData()
        }.store(in: &subscriber)
    }
}
