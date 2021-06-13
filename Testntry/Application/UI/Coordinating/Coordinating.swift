//
//  Coordinating.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

protocol Coordinating {
    func start()
}

extension Coordinating where Self: Any {
    func with(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

class Coordinator: Coordinating {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        if let navigationController = navigationController {
            self.navigationController = navigationController
        } else {
            fatalError("UINavigationController required")
        }
    }
    
    func start() {
        fatalError("not implemented")
    }
    
}
