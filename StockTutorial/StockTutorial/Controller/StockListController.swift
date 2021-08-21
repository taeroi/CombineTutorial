//
//  StockListController.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit
import Pure
import RxSwift
import RxCocoa

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
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        connectObservers(scrollView: selfView.tableView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disconnectObservers()
    }
    
    
    //MARK: - Override Methods

    override func setupTableView() {
        selfView.tableView.delegate = self
        selfView.tableView.dataSource = self
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
        selfView.searchViewController.searchBar.rx.text
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [unowned self] text in
            guard let text  = text, !text.isEmpty else { return }
            self.viewModel.searchQueryChanged(query: text)
        }).disposed(by: disposeBag)
        
        viewModel.$errorMessage.sink { errorMessage in
            guard let message = errorMessage, !message.isEmpty else { return }
            debugPrint(message)
        }.store(in: &subscriber)
        
        viewModel.$stocks.sink { [unowned self] _ in
            self.selfView.tableView.reloadData()
        }.store(in: &subscriber)
        
        viewModel.$loading.sink { [unowned self] loading in
            self.selfView.loadingView.isHidden = !loading
            debugPrint("loading: ", loading)
        }.store(in: &subscriber)
    }
}

extension StockListController: UISearchControllerDelegate {
    
}

extension StockListController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
