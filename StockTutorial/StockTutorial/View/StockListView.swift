//
//  StockListView.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit

class StockListView: BaseView {
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let searchViewController: UISearchController = {
        let view = UISearchController(searchResultsController: nil)
        view.searchBar.placeholder = "회사명을 입력해주세요"
        view.obscuresBackgroundDuringPresentation = false
        return view
    }()
    
    let loadingView = LoadingView()
    
    
    override func setupViews() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        loadingView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        loadingView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    override func setupTableView() {
        tableView.register(StockCell.self, forCellReuseIdentifier: StockCell.identifier)
        tableView.separatorStyle = .none
    }
}
