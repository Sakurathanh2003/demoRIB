//
//  ManTwoBuilder.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs

protocol ManTwoDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ManTwoComponent: Component<ManTwoDependency>, ManOneDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ManTwoBuildable: Buildable {
    func build(withListener listener: ManTwoListener) -> ManTwoRouting
}

final class ManTwoBuilder: Builder<ManTwoDependency>, ManTwoBuildable {

    override init(dependency: ManTwoDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ManTwoListener) -> ManTwoRouting {
        let component = ManTwoComponent(dependency: dependency)
        let viewController = ManTwoViewController()
        let interactor = ManTwoInteractor(presenter: viewController)
                
        interactor.listener = listener
        return ManTwoRouter(interactor: interactor, viewController: viewController)
    }
}
