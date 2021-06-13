//
//  MainVC.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class MainVC: BaseVC {
    
    var presenter: MainPresenter!
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
        presenter.complition = { [weak self] value in
            guard let _ = self else { return }
            switch value {
            case .didLoadHolidays(let days):
                print(days)
            case .error(let error):
                print(error)
            }
        }
        presenter.handle(output: .viewDidLoad)
    }
    
}
