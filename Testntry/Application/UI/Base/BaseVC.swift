//
//  BaseVC.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class BaseVC: UIViewController {
    
    var coordinator: Coordinating!
    var styler: Styling!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styler.apply(to: self)
    }
    
}
