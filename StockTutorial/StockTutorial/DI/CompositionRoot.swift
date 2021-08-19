//
//  CompositionRoot.swift
//  StockTutorial
//
//  Created by 태로고침 on 2021/08/19.
//

struct AppDependency {
    let mainCoordinator: MainCoordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let mainCoordinator: MainCoordinator = .init()

        return .init(mainCoordinator: mainCoordinator)
    }
}
