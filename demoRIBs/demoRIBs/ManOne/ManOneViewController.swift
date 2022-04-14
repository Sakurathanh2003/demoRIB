//
//  ManOneViewController.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs
import RxSwift
import UIKit

protocol ManOnePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func backToHome()
}

final class ManOneViewController: UIViewController, ManOnePresentable, ManOneViewControllable {

    weak var listener: ManOnePresentableListener?
    
    @IBAction func backDidTap(_ sender: Any) {
        listener?.backToHome()
    }
    
}
