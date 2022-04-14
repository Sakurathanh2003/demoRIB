//
//  ManTwoInteractor.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs
import RxSwift

protocol ManTwoRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ManTwoPresentable: Presentable {
    var listener: ManTwoPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ManTwoListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func backManTwoToHome()
    func routeManTwoToManOne()
    func routeToManOne()
}

final class ManTwoInteractor: PresentableInteractor<ManTwoPresentable>, ManTwoInteractable {

    weak var router: ManTwoRouting?
    weak var listener: ManTwoListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ManTwoPresentable) {
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

extension ManTwoInteractor: ManTwoPresentableListener {
    func routeToManOneOptionTwo() {
        listener?.routeToManOne()
    }
    
    func routeToManOne() {
        listener?.routeManTwoToManOne()
    }
    
    func backToHome() {
        listener?.backManTwoToHome()
    }
}

