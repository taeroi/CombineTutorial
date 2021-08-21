//
//  BaseView.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .systemBackground
    }
    
    func setupTableView() { }
}
