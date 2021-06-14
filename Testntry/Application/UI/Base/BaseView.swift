//
//  BaseView.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import UIKit

class BaseView: UIView {
    
    var styler: Styling! {
        didSet {
            styler.apply(to: self)
        }
    }
    
}
