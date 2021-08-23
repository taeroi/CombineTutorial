//
//  DateSelectionCell.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/23.
//

import UIKit

final class DateSelectionCell: UITableViewCell {
    
    static let identifer = "DateSelectionCellIdentifier"
    
    let titleLabel: TitleLabel = .init()
    let descriptionLabel: NormalGrayLabel = .init()
    let checkmarkImageView: UIImageView = {
       let view = UIImageView()
        view.image = .checkmark
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews(views: [titleLabel,
                            descriptionLabel,
                            checkmarkImageView])
        
        addTranslatesAutoresizingMaskIntoConstraints(views: [titleLabel,
                                                             descriptionLabel,
                                                             checkmarkImageView])
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        checkmarkImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkmarkImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(with monthInfo: MonthInfo, index: Int, previousMonthInfo: MonthInfo?) {
        titleLabel.text = monthInfo.date.MMYYFormat
        
        switch index {
        case 0:
            descriptionLabel.text = "Just Invented"
        case 1:
            descriptionLabel.text = "1 Month Ago"
        default:
            descriptionLabel.text = "\(index) Months Ago"
        }
        
        if let prevMonthInfo = previousMonthInfo {
            if prevMonthInfo.date == monthInfo.date {
                checkmarkImageView.isHidden = false
            } else {
                checkmarkImageView.isHidden = true
            }
        } else {
            checkmarkImageView.isHidden = true
        }
    }
    
}
