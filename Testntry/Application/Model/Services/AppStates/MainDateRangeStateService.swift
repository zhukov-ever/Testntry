//
//  HolidaysStateService.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import Foundation

class MainDateRangeStateService {
    
    var state: HolidaysAppState
    
    init() {
        let today = Date()
        let startDate = Date().apiDate2string() ?? L10n.Data.empty
        let endDate = Calendar.current.date(byAdding: .day, value: AppParams.daysRangeAtHome, to: today)?.apiDate2string() ?? L10n.Data.empty
        state = HolidaysAppState(startDate: startDate, endDate: endDate, firstDay: 0)
    }
}
