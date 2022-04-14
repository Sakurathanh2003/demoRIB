//
//  ManOneInteractor.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs
import RxSwift

protocol ManOneRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ManOnePresentable: Presentable {
    var listener: ManOnePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ManOneListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func backToHome(animated: Bool)
}

final class ManOneInteractor: PresentableInteractor<ManOnePresentable>, ManOneInteractable {

    weak var router: ManOneRouting?
    weak var listener: ManOneListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ManOnePresentable) {
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

extension ManOneInteractor: ManOnePresentableListener {
    func backToHome() {
        listener?.backToHome(animated: true)
    }
}
