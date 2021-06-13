//
//  Holiday.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

enum HolidayType {
    case folk
    case `public`
}

struct DayInfo {
    let dateString: String
    let holidays: [Holidays]
}

struct Holidays {
    let name: String
    let type: HolidayType
}
