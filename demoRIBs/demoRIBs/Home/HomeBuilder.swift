//
//  HomeBuilder.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs

protocol HomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class HomeComponent: Component<HomeDependency> , ManOneDependency, ManTwoDependency{

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> HomeRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {

    override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: HomeListener) -> HomeRouting {
        let component = HomeComponent(dependency: dependency)
        let viewController = HomeViewController()
        let interactor = HomeInteractor(presenter: viewController)
        
        let manOneBuilder = ManOneBuilder(dependency: component)
        let manTwoBuilder = ManTwoBuilder(dependency: component)
        
        interactor.listener = listener
        return HomeRouter(interactor: interactor, viewController: viewController, manOneBuilder: manOneBuilder, manTwoBuilder: manTwoBuilder)
    }
}
