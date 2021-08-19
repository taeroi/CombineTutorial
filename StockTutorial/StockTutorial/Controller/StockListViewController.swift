//
//  StockListViewController.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit

class StockListViewController: BaseViewController {
    let stockListView = StockListView()
    
    override func setupViews() {
        view.addSubview(stockListView)
        stockListView.translatesAutoresizingMaskIntoConstraints = false
        stockListView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stockListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stockListView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stockListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
