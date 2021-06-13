//
//  MainStyler.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

class MainStyler: Styling {
    
    func apply(to: Any) {
        guard let vc = to as? MainVC else { fatalError() }
        
        vc.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
