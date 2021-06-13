//
//  ViewController.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class LaunchVC: BaseVC {

    var coordinateNext: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinateNext?()
    }

}

