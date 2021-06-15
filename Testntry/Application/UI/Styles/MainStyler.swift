//
//  MainStyler.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class MainStyler: Styling {
    
    func apply(to: Any) {
        switch to {
        case let vc as MainVC:
            vc.navigationController?.setNavigationBarHidden(true, animated: true)
            
            vc.tableHeader.backgroundColor = Asset.Colors.accent.color
            
            vc.labelDateRange.adjustsFontSizeToFitWidth = true
            vc.labelDateRange.textAlignment = .center
            vc.labelDateRange.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            vc.labelDateRange.textColor = Asset.Colors.textOnAccent.color
            
            vc.labelFirstDaytitle.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            vc.labelFirstDaytitle.textColor = Asset.Colors.textOnAccent.color
            
            vc.buttonPrev.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            vc.buttonPrev.setTitleColor(Asset.Colors.textOnAccent.color, for: .normal)
            vc.buttonPrev.setTitleColor(Asset.Colors.textOnAccent.color.withAlphaComponent(0.5), for: .highlighted)
            
            vc.buttonNext.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            vc.buttonNext.setTitleColor(Asset.Colors.textOnAccent.color, for: .normal)
            vc.buttonNext.setTitleColor(Asset.Colors.textOnAccent.color.withAlphaComponent(0.5), for: .highlighted)
            
            vc.buttonFirstDaySelector.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            vc.buttonFirstDaySelector.backgroundColor = Asset.Colors.background.color
            vc.buttonFirstDaySelector.layer.cornerRadius = 4
            vc.buttonFirstDaySelector.setTitleColor(Asset.Colors.textOnBackground.color, for: .normal)
            vc.buttonFirstDaySelector.setTitleColor(Asset.Colors.textOnBackground.color.withAlphaComponent(0.5), for: .highlighted)
            
            vc.view.backgroundColor = Asset.Colors.accent.color
            vc.tableView.backgroundColor = Asset.Colors.background.color
            vc.tableView.separatorStyle = .none
            vc.tableView.allowsSelection = false
        case let headerView as MainSectionHeaderView:
            headerView.backgroundColor = .clear
            
            headerView.labelTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            headerView.labelTitle.textColor = Asset.Colors.textOnBackground.color
        case let cell as FolkHolidayCell:
            cell.backgroundColor = .clear
            cell.contentView.backgroundColor = .clear
            
            cell.cardView.backgroundColor = Asset.Colors.backgroundFolkHolidays.color
            cell.cardView.layer.cornerRadius = 12
            
            cell.labelTitle.textColor = Asset.Colors.textOnBackgroundFolkHolidays.color
            cell.labelTitle.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        case let cell as PublicHoilidayCell:
            cell.backgroundColor = .clear
            cell.contentView.backgroundColor = .clear
            
            cell.cardView.backgroundColor = Asset.Colors.backgroundPublicDays.color
            cell.cardView.layer.cornerRadius = 12
            
            cell.labelTitle.textColor = Asset.Colors.textOnBackgroundPublicDays.color
            cell.labelTitle.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        case let cell as NoEventsCell:
            cell.backgroundColor = .clear
            cell.contentView.backgroundColor = .clear
            
            cell.labelTitle.textColor = Asset.Colors.textOnBackground.color
            cell.labelTitle.font = UIFont.italicSystemFont(ofSize: 16)
        default:
            break
        }
        
        
    }
    
}
