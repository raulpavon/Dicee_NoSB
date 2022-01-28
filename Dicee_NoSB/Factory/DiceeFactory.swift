//
//  DiceeFactory.swift
//  Dicee_NoSB
//
//  Created by Raúl Pavón on 28/01/22.
//

import Foundation

protocol DiceeFactory {
    func makeDiceeViewController(diceeCoordinator: DiceeCoordinator) -> DiceeViewController
}

class DiceeFactoryImp: DiceeFactory {
    func makeDiceeViewController(diceeCoordinator: DiceeCoordinator) -> DiceeViewController {
        let diceeViewController = DiceeViewController(factory: self, diceeCoordinator: diceeCoordinator)
        return diceeViewController
    }
}
