//
//  ManOneRouter.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs

protocol ManOneInteractable: Interactable {
    var router: ManOneRouting? { get set }
    var listener: ManOneListener? { get set }
}

protocol ManOneViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ManOneRouter: ViewableRouter<ManOneInteractable, ManOneViewControllable>, ManOneRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ManOneInteractable, viewController: ManOneViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
