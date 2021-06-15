//
//  EntityMappers.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

extension Dictionary where Key == String, Value == [HolidayByDayResponseModel] {
    func map2appModel() -> [DayInfo] {
        enumerated().map {
            DayInfo(dateString: $0.element.key,
                    holidays: $0.element.value.map2appModel())
            
        }
    }
}

extension Array where Element == HolidayByDayResponseModel {
    func map2appModel() -> [Holidays] {
        map { Holidays(name: $0.name, type: $0.type.map2appModel()) }
    }
}

extension HolidayResponseType {
    func map2appModel() -> HolidayType {
        switch self {
        case .folk:
            return .folk
        case .public:
            return .public
        }
    }
}
