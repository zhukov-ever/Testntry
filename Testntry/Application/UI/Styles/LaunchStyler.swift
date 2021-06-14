//
//  LaunchStyler.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class LaunchStyler: Styling {
    
    func apply(to: Any) {
        guard let vc = to as? LaunchVC else { fatalError() }
        
        vc.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}
