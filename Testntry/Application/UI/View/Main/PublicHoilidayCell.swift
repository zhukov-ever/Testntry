//
//  PublicHoilidayCell.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class PublicHoilidayCell: BaseTableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    var element: Holidays! {
        didSet {
            labelTitle.text = element.name
        }
    }
    
}
