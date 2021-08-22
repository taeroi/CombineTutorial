//
//  StockDetailController.swift
//  StockTutorial
//
//  Created by 박태환 on 2021/08/22.
//

import UIKit
import Pure

final class StockDetailController: BaseViewController, FactoryModule {
    struct Dependency {
        let stock: Stock
    }
    
    let selfView = StockDetailView()
    
    let stock: Stock
    
    init(dependency: Dependency, payload: ()) {
        stock = dependency.stock
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        connectObservers(scrollView: selfView.scrollView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        disconnectObservers()
    }
    
    
    override func setupViews() {
        
        view.addSubview(selfView)
        selfView.translatesAutoresizingMaskIntoConstraints = false
        selfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selfView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        selfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        selfView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
