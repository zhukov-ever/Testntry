//
//  LaunchCoordinator.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class LaunchCoordinator: Coordinator {
    
    override func start() {
        let launchVC = StoryboardScene.LaunchIB.initialScene.instantiate()
        launchVC.styler = Assembly.shared.launchStyler()
        launchVC.coordinator = self
        
        navigationController?.pushViewController(launchVC, animated: false)
    }
    
}
