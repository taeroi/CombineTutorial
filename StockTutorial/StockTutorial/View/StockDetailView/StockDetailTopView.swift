//
//  StockDetailTopView.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit

final class StockDetailTopView: BaseView {

    let titleLabel = TitleLabel()
    let subTitleLabel = NormalGrayLabel()
    let currentValueTextLabel = SmallLabel()
    let currentValueValueLabel = TitleLabel()
    let investmentLabel = SmallLabel()
    let investmetnValueLabel = SmallBoldLabel()
    let gainLabel = SmallLabel()
    let gainValueLabel = SmallBoldLabel()
    let annualReturnLabel = SmallLabel()
    let annualReturnValueLabel = SmallBoldLabel()
    
    override func setupViews() {
        addSubviews(views: [titleLabel,
                            subTitleLabel,
                            currentValueTextLabel,
                            currentValueValueLabel,
                            investmentLabel,
                            investmetnValueLabel,
                            gainLabel,
                            gainValueLabel,
                            annualReturnLabel,
                            annualReturnValueLabel])
        
        addTranslatesAutoresizingMaskIntoConstraints(views: [titleLabel,
                                                             subTitleLabel,
                                                             currentValueTextLabel,
                                                             currentValueValueLabel,
                                                             investmentLabel,
                                                             investmetnValueLabel,
                                                             gainLabel,
                                                             gainValueLabel,
                                                             annualReturnLabel,
                                                             annualReturnValueLabel])
        
        titleLabel.text = "NO DATA"
        subTitleLabel.text = "NO DATA"
        currentValueTextLabel.text = "NO DATA"
        currentValueValueLabel.text = "NO DATA"
        investmentLabel.text = "Investment"
        investmetnValueLabel.text = "NO DATA"
        gainLabel.text = "Gain"
        gainValueLabel.text = "NO DATA"
        annualReturnLabel.text = "Annual Return"
        annualReturnValueLabel.text = "NO DATA"
                
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        subTitleLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 10).isActive = true
        subTitleLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        
        currentValueTextLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        currentValueTextLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 10).isActive = true
        
        currentValueValueLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        currentValueValueLabel.topAnchor.constraint(equalTo: currentValueTextLabel.bottomAnchor, constant: 10).isActive = true
        
        investmentLabel.topAnchor.constraint(equalTo: currentValueValueLabel.bottomAnchor, constant: 16).isActive = true
        investmentLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        
        investmetnValueLabel.centerYAnchor.constraint(equalTo: investmentLabel.centerYAnchor).isActive = true
        investmetnValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
            
        gainLabel.topAnchor.constraint(equalTo: investmetnValueLabel.bottomAnchor, constant: 16).isActive = true
        gainLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        
        gainValueLabel.centerYAnchor.constraint(equalTo: gainLabel.centerYAnchor).isActive = true
        gainValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        annualReturnLabel.topAnchor.constraint(equalTo: gainValueLabel.bottomAnchor, constant: 10).isActive = true
        annualReturnLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        
        annualReturnValueLabel.centerYAnchor.constraint(equalTo: annualReturnLabel.centerYAnchor).isActive = true
        annualReturnValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        annualReturnValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true 
    }
    
    func configureUI(with dcaResult: DCARepositoryImpl.DCAResult, stock: Stock) {
        titleLabel.text = stock.symbol
        subTitleLabel.text = stock.name
        currentValueTextLabel.text = "Stock Value (\(String(describing: stock.currency ?? "")))"
        
        currentValueValueLabel.text = dcaResult.currentValue.stringValue
        investmetnValueLabel.text = "\(stock.currency ?? "") \(dcaResult.investmentAmount)"
        gainValueLabel.text = "\(dcaResult.gain) \(dcaResult.yield)"
        annualReturnValueLabel.text = dcaResult.annualReturn.stringValue
        
    }
}
