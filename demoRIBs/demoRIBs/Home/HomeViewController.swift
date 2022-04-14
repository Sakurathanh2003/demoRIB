//
//  HomeViewController.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func routeToManOne()
    func routeToManTwo()
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

    weak var listener: HomePresentableListener?
    
    @IBAction func routeToManOne(_ sender: Any) {
        listener?.routeToManOne()
    }
    
    @IBAction func routeToManTwo(_ sender: Any) {
        listener?.routeToManTwo()
    }
    
}
