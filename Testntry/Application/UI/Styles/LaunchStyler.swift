//
//  LaunchStyler.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

class LaunchStyler: Styling {
    
    func apply(to: BaseVC) {
        guard let vc = to as? LaunchVC else { fatalError() }
        
        print(vc.description)
    }
    
}
