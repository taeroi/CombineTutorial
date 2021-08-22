//
//  StockDetailBottomView.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit

final class StockDetailBottomView: BaseView {
    
    let investmetnInputView = InputView()
    let costInputView = InputView()
    let dateInputView = InputView()
    let slider = UISlider()
    
    override func setupViews() {
        addSubviews(views: [investmetnInputView,
                            costInputView,
                            dateInputView,
                            slider])
        
        addTranslatesAutoresizingMaskIntoConstraints(views: [investmetnInputView,
                                                             costInputView,
                                                             dateInputView,
                                                             slider])
        
        investmetnInputView.configureUI(placeholder: "Enter Your Initial Investment Amount", descriptionLabelText: "Initial Investment Amount")
        costInputView.configureUI(placeholder: "Montly Dollar Cost Averaging Amount", descriptionLabelText: "Montly Dollar Cost Averaging Amount")
        dateInputView.configureUI(placeholder: "Enter the initial date of investment", descriptionLabelText: "Enter the initial date of investment")
        
        investmetnInputView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        investmetnInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        investmetnInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        investmetnInputView.textField.keyboardType = .numberPad
        investmetnInputView.textField.addDoneButton()
        
        costInputView.topAnchor.constraint(equalTo: investmetnInputView.bottomAnchor, constant: 8).isActive = true
        costInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        costInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        costInputView.textField.keyboardType = .numberPad
        costInputView.textField.addDoneButton()
        
        dateInputView.topAnchor.constraint(equalTo: costInputView.bottomAnchor, constant: 8).isActive = true
        dateInputView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        dateInputView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        dateInputView.textField.keyboardType = .numberPad
        
        slider.topAnchor.constraint(equalTo: dateInputView.bottomAnchor, constant: 8).isActive = true
        slider.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        slider.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
   
    }
    
    func configureUI(currency: String) {
        investmetnInputView.valueLabel.text = currency
        costInputView.valueLabel.text = currency
        dateInputView.valueLabel.text = currency
    }
    
    class InputView: BaseView {
        let textField = UITextField()
        let descriptionLabel = SmallLabel()
        let valueLabel = NormalGrayLabel()
        
        override func setupViews() {
            textField.font = UIFont.systemFont(ofSize: 18)
            textField.autocorrectionType = .no
            
            addSubviews(views: [textField,
                                descriptionLabel,
                                valueLabel])
            
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
            textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8).isActive = true
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            
            valueLabel.translatesAutoresizingMaskIntoConstraints = false
            valueLabel.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor).isActive = true
            valueLabel.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 4).isActive = true
            
        }
        
        func configureUI(placeholder: String, descriptionLabelText: String, value: String? = "(USD)") {
            textField.placeholder = placeholder
            descriptionLabel.text = descriptionLabelText
            valueLabel.text = value
        }
        
    }
}
