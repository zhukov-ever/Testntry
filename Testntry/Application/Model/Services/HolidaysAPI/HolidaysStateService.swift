//
//  HolidaysStateService.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import Foundation

class HolidaysStateService {
    
    var state: HolidaysAppState
    
    init() {
        state = HolidaysAppState(startDate: "2019-02-01", endDate: "2019-02-28", firstDay: 0)
    }
}
