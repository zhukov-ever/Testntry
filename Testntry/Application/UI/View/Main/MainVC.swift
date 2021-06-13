//
//  MainVC.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class MainVC: BaseVC {
    
    var coordinateFinishLoading: (() -> Void)?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinateFinishLoading?()
        configure()
    }
    
}


// MARK: - private
extension MainVC {
    
    fileprivate func configure() {
        
    }
    
}
