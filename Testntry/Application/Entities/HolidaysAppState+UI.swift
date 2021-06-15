//
//  HolidaysAppState+UI.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import Foundation

extension HolidaysAppState {

    var startDate4title: String {
        return startDate.apiString2date()?.uiTitleDate2string() ?? L10n.Data.empty
    }
    var endDate4title: String {
        return endDate.apiString2date()?.uiTitleDate2string() ?? L10n.Data.empty
    }
    var firstDay4title: String {
        return firstDay.dayOfWeek() ?? L10n.Data.empty
    }
}
