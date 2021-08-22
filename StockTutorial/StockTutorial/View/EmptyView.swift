//
//  EmptyView.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit

final class EmptyView: BaseView {
    
    let descriptionLabel = NormalLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        descriptionLabel.text = "내용이 존재하지 않습니다."
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}

