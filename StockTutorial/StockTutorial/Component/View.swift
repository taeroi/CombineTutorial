//
//  View.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach { someView in
            self.addSubview(someView)
        }
    }
}
