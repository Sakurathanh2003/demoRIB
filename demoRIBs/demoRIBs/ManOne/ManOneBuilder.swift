//
//  ManOneBuilder.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs

protocol ManOneDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ManOneComponent: Component<ManOneDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ManOneBuildable: Buildable {
    func build(withListener listener: ManOneListener) -> ManOneRouting
}

final class ManOneBuilder: Builder<ManOneDependency>, ManOneBuildable {

    override init(dependency: ManOneDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ManOneListener) -> ManOneRouting {
        let component = ManOneComponent(dependency: dependency)
        let viewController = ManOneViewController()
        let interactor = ManOneInteractor(presenter: viewController)
        interactor.listener = listener
        return ManOneRouter(interactor: interactor, viewController: viewController)
    }
}
