//
//  HomeRouter.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs

protocol HomeInteractable: Interactable, ManOneListener, ManTwoListener {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable> {
    
    var manOneBuilder: ManOneBuildable
    var manOneRooting: ManOneRouting?
    
    var manTwoBuilder: ManTwoBuildable
    var manTwoRooting: ManTwoRouting?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: HomeInteractable, viewController: HomeViewControllable, manOneBuilder: ManOneBuilder, manTwoBuilder: ManTwoBuilder) {
        self.manOneBuilder = manOneBuilder
        self.manTwoBuilder = manTwoBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension HomeRouter: HomeRouting {
    func backManTwoToHome(animate: Bool) {
        guard let routing = manTwoRooting else {
            return
        }
        
        self.viewControllable.uiviewController.navigationController?.popViewController(animated: animate)
        detachChild(routing)
        self.manTwoRooting = nil
    }
    
    func routeToManTwo() {
        let manTwoRouter = manTwoBuilder.build(withListener: interactor)
        attachChild(manTwoRouter)
        
        self.viewController.uiviewController.navigationController?.pushViewController(manTwoRouter.viewControllable.uiviewController, animated: true)
        self.manTwoRooting = manTwoRouter
    }
    
    func backToHome(animate: Bool) {
        guard let routing = manOneRooting else {
            return
        }
        
        self.viewControllable.uiviewController.navigationController?.popViewController(animated: animate)
        detachChild(routing)
        self.manOneRooting = nil
    }
    
    func routeToManOne() {
        let manOneRouter = manOneBuilder.build(withListener: interactor)
        attachChild(manOneRouter)
        
        self.viewController.uiviewController.navigationController?.pushViewController(manOneRouter.viewControllable.uiviewController, animated: true)
        
        self.manOneRooting = manOneRouter
    }
    
}
