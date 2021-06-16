//
//  HolidaysStateService.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import Foundation

class MainDateRangeStateService {
    
    var state: MainDateRangeState
    
    init() {
        let initialDate = Date().startOfWeek ?? Date()
        let startDate = initialDate.apiDate2string() ?? L10n.Data.empty
        let endDate = Calendar.current.date(byAdding: .day, value: AppParams.daysRangeAtHome - 1, to: initialDate)?.apiDate2string() ?? L10n.Data.empty
        state = MainDateRangeState(startDate: startDate, endDate: endDate, firstDay: 0)
    }
}
