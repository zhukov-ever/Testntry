//
//  Holiday+UI.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import Foundation

extension DayInfo {
    var dateString4tableHeaders: String {
        return dateString.apiString2date()?.uiTableHeadersDate2string() ?? L10n.Data.empty
    }    
}
