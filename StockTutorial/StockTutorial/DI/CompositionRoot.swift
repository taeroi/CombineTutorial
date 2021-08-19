//
//  CompositionRoot.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

struct AppDependency {
    let coordinator: Coordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let coordinator: Coordinator = .init()
        
        return .init(coordinator: coordinator)
    }
}
