//
//  StockListController.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit
import Pure

class StockListController: BaseViewController, FactoryModule {
    
    struct Dependency {
        let viewModel: StockListViewModel
    }

    let selfView = StockListView()
    let viewModel: StockListViewModel
    
    
    required init(dependency: Dependency, payload: ()) {
        viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        
        bind()
        viewModel.viewDidLoad()
    }
    
    override func setupViews() {
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        navigationItem.searchController = selfView.searchViewController
    }
    
    private func setupSearchController() {
        selfView.searchViewController.delegate = self
        selfView.searchViewController.searchResultsUpdater = self
    }
    
    func bind() {
        viewModel.loading.subscribe(onNext: { loading in
            debugPrint("loading: \(loading)")
        }).disposed(by: disposeBag)
        
        viewModel.errorMessage.subscribe(onNext: { error in
            guard let error = error else { return }
            debugPrint("error: \(error)")
        }).disposed(by: disposeBag)
        
        viewModel.stocks.subscribe(onNext: { stocks in
            debugPrint("stocks: \(stocks)")
        }).disposed(by: disposeBag)
    }
}

extension StockListController: UISearchControllerDelegate {
    
}

extension StockListController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
