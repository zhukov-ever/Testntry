//
//  MainSectionHeaderView.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import UIKit

class MainSectionHeaderView: BaseView {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    var element: DayInfo! {
        didSet {
            labelTitle.text = element.dateString
        }
    }
    
}
