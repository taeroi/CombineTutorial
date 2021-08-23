//
//  StockDetailController.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit
import Pure

final class StockDetailController: BaseViewController, FactoryModule {
    struct Dependency {
        let stock: Stock
        let viewModel: StockDetailViewModel
    }
    
    let selfView = StockDetailView()
    let viewModel: StockDetailViewModel
    let stock: Stock
    var coordinator: MainCoordinator?
    
    required init(dependency: Dependency, payload: ()) {
        stock = dependency.stock
        viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.viewDidLoad(symbol: dependency.stock.symbol ?? "", stock: dependency.stock)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad(symbol: stock.symbol ?? "", stock: stock)
        setupTextfield()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        connectObservers(scrollView: selfView.scrollView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        disconnectObservers()
    }
    
    
    //MARK: - Override Methods
    
    override func setupViews() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    override func bind() {
        
        //ViewModel - loading
        viewModel.$loading.sink { loading in
            self.selfView.loadingView.isHidden = !loading
        }.store(in: &subscriber)
        
        //ViewModel - stock
        viewModel.$stock.sink { [unowned self] stock in
            guard let stock = stock else { return }
            self.selfView.topView.titleLabel.text = stock.symbol
            self.selfView.topView.subTitleLabel.text = stock.name
            
            if let currency = stock.currency {
                self.selfView.topView.currentValueTextLabel.text = "Current Value (\(currency))"
                self.selfView.bottomView.configureUI(currency: currency)
            }
        }.store(in: &subscriber)
        
        //ViewModel - errorMessage
        viewModel.$errorMessage.sink { errorMessage in
            guard let errorMessage = errorMessage else { return }
            debugPrint("Error: ", errorMessage)
        }.store(in: &subscriber)
    
        //ViewModel - timeSeriresMontlyAdjusted
        viewModel.$timeSeriresMontlyAdjusted.sink { timeSeriresMontlyAdjusted in
            guard let timeSeriresMontlyAdjusted = timeSeriresMontlyAdjusted else { return }
            self.selfView.bottomView.slider.maximumValue = Float(timeSeriresMontlyAdjusted.series.count)
        }.store(in: &subscriber)
        
        //ViewModel - selectedMonthInfo
        viewModel.$selectedMonthInfo.sink { monthInfo in
            guard let monthInfo = monthInfo else { return }
            self.selfView.bottomView.dateInputView.textField.text = monthInfo.date.MMYYDDFormat
        }.store(in: &subscriber)
        
        //ViewModel - slider
        viewModel.$sliderIndex.sink { index in
            guard let index = index else { return }
            self.selfView.bottomView.slider.value = Float(index)
        }.store(in: &subscriber)
        
        //ViewModel - dcaResult
        viewModel.$dcaResult.sink { [unowned self] dcaResult in
            guard let dcaResult = dcaResult,
                  let stock = viewModel.stockRF else { return }
            print("thth", dcaResult, stock)
            self.selfView.topView.configureUI(with: dcaResult, stock: stock)
        }.store(in: &subscriber)
    }
    
    
    private func setupTextfield() {
        selfView.bottomView.dateInputView.textField.delegate = self
    }
    
}

extension StockDetailController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == selfView.bottomView.dateInputView.textField {
            if let timeSeriesMonthlyAdjusted = self.viewModel.timeSeriesMonthlyAdjustedRf {
                coordinator?.dateInputTextFieldTapped(with: timeSeriesMonthlyAdjusted, monthInfo: viewModel.selectedMonthInfoRF)
            }
            return false
        }
        return true
    }
}
