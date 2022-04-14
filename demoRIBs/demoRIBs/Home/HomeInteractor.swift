//
//  HomeInteractor.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs
import RxSwift

protocol HomeRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToManOne()
    func routeToManTwo()
    func backToHome(animate: Bool)
    func backManTwoToHome(animate: Bool)
}

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol HomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable {

    weak var router: HomeRouting?
    weak var listener: HomeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: HomePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

// MARK: - HomePresentableListener
extension HomeInteractor: HomePresentableListener {
    func routeToManTwo() {
        router?.routeToManTwo()
    }
    
    func routeToManOne() {
        router?.routeToManOne()
    }
}

// MARK: - ManOneListener
extension HomeInteractor: ManOneListener {
    func backToHome(animated: Bool) {
        router?.backToHome(animate: true)
    }
}

// MARK: - ManTwoListener
extension HomeInteractor: ManTwoListener {
    func routeManTwoToManOne() {
        router?.backManTwoToHome(animate: true)
        router?.routeToManOne()
    }
    
    func backManTwoToHome() {
        router?.backManTwoToHome(animate: true)
    }
}
