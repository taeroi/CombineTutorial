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
    
    override func setupViews() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
