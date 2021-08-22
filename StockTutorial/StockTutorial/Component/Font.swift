//
//  Font.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit


// MARK: - Small Label

class SmallLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont.systemFont(ofSize: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class SmallBoldLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont.boldSystemFont(ofSize: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 

//MARK: - Color Label

class NormalGrayLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .systemGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: Normal Label

class NormalLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
