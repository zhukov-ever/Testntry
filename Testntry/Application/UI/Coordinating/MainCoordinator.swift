//
//  MainCoordinator.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

class MainCoordinator: Coordinator {
    
    override func start() {
        let vc = StoryboardScene.MainIB.initialScene.instantiate()
        vc.coordinator = self
        vc.styler = Assembly.shared.mainStyler()
        
        vc.coordinateFinishLoading = { [weak self] in
            guard let lastVC = self?.navigationController?.viewControllers.last else { return }
            lastVC.navigationItem.hidesBackButton = true
            
            self?.navigationController?.viewControllers = [lastVC]
        }
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
