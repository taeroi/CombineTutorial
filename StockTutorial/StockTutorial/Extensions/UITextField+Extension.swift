//
//  UITextField+Extension.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit

extension UITextField {
    func addDoneButton() {
        let scrrenWidth = UIScreen.main.bounds.width
        let toolbar = UIToolbar(frame: .init(x: 0, y: 0, width: scrrenWidth, height: 50))
        toolbar.barStyle = .default
        
        let flexBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        
        let items = [flexBarButtonItem, doneBarButtonItem]
        toolbar.items = items
        toolbar.sizeToFit()
        inputAccessoryView = toolbar
    }
    
    @objc
    private func dismissKeyboard() {
        resignFirstResponder()
    }
}
