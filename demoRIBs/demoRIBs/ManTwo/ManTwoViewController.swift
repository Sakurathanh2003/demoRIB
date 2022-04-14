//
//  ManTwoViewController.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs
import RxSwift
import UIKit

protocol ManTwoPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func backToHome()
    func routeToManOne()
    func routeToManOneOptionTwo()
}

final class ManTwoViewController: UIViewController, ManTwoPresentable, ManTwoViewControllable {

    weak var listener: ManTwoPresentableListener?
    
    @IBAction func backToHome(_ sender: Any) {
        listener?.backToHome()
    }
    
    @IBAction func routeToManOne(_ sender: Any) {
        listener?.routeToManOne()
    }
    
    
    @IBAction func routeToManOneOptionTwo(_ sender: Any) {
        listener?.routeToManOneOptionTwo()
    }
    
}
