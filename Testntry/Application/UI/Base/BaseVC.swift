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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        styler.apply(to: self)
    }
    
}
