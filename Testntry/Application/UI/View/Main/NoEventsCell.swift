//
//  NoEventsCell.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class NoEventsCell: BaseTableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        labelTitle.text = L10n.Screen.Main.Cell.noEvents
    }
    
}
