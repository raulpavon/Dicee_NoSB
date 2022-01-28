//
//  DiceeCoordinator.swift
//  Dicee_NoSB
//
//  Created by Raúl Pavón on 28/01/22.
//

import Foundation
import UIKit

class DiceeCoordinator {
    var navigationController: UINavigationController
    private let factory =  DiceeFactoryImp()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let diceeViewController = factory.makeDiceeViewController(diceeCoordinator: self)
        navigationController.setViewControllers([diceeViewController], animated: false)
    }
}
