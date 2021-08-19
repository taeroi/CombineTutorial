//
//  StockListViewController.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit

class StockListViewController: BaseViewController {
    
    let selfView = StockListView()
    
    
    //MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
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
}

extension StockListViewController: UISearchControllerDelegate {
    
}

extension StockListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
