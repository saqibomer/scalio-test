//
//  AppCoordinator.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let vc = ViewController.instantiate()
        let navController = UINavigationController(rootViewController: vc)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
}
