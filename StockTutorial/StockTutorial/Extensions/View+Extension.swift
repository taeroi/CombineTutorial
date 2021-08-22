//
//  View.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit

extension UIView {
    
    /// 하위 뷰를 추가합니다
    func addSubviews(views: [UIView]) {
        views.forEach { someView in
            self.addSubview(someView)
        }
    }
    
    ///지정된 View들의 TranslatesAutoresizingMaskIntoConstraints를 false로 설정합니다
    func addTranslatesAutoresizingMaskIntoConstraints(views: [UIView]) {
        views.forEach { someView in
            someView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}
