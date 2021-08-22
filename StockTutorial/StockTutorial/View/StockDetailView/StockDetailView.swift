//
//  StockDetailView.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit

final class StockDetailView: BaseView {
    
    let scrollView = UIScrollView()
    let topView = StockDetailTopView()
    let bottomView = StockDetailBottomView()
    
    override func setupViews() {
        addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        scrollView.addSubviews(views: [topView, bottomView])
        addTranslatesAutoresizingMaskIntoConstraints(views: [topView, bottomView])
        
        topView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        bottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
    }
}
