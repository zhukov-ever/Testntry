//
//  LaunchCoordinator.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class LaunchCoordinator: Coordinator {
    
    override func start() {
        let vc = StoryboardScene.LaunchIB.initialScene.instantiate()
        vc.styler = Assembly.shared.launchStyler()
        vc.coordinator = self
        
        vc.coordinateNext = { [weak self] in
            MainCoordinator.init(navigationController: self?.navigationController)
                .start()
        }
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
