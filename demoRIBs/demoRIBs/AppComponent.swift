//
//  AppComponent.swift
//  demoRIBs
//
//  Created by Vu Thanh on 14/04/2022.
//

import UIKit
import RIBs

class AppComponent: Component<EmptyComponent>, RootDependency {
    var window: UIWindow
    
    internal init(window: UIWindow) {
        self.window = window
        super.init(dependency: EmptyComponent())
    }
}
