//
//  ManTwoRouter.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs

protocol ManTwoInteractable: Interactable {
    var router: ManTwoRouting? { get set }
    var listener: ManTwoListener? { get set }
}

protocol ManTwoViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ManTwoRouter: ViewableRouter<ManTwoInteractable, ManTwoViewControllable>, ManTwoRouting {
    
    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ManTwoInteractable, viewController: ManTwoViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
