//
//  StockCell.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit

class StockCell: UITableViewCell {
    
    static let identifier = "StockCellIdentifier"
    
    let symbolLabel = TitleLabel()
    let descriptionLabel = NormalGrayLabel()
    let companyNameLabel = NormalLabel()
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            backgroundColor = .gray
        } else {
            backgroundColor = .systemBackground
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews(views: [symbolLabel,
                            descriptionLabel,
                            companyNameLabel])
        
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        symbolLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 12).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: symbolLabel.leftAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
                
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        companyNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        companyNameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(item: Stock) {
        symbolLabel.text = item.symbol
        descriptionLabel.text = "\(item.type ?? "") i\(item.currency ?? "")"
        companyNameLabel.text = item.name
    }
}
