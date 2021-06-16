//
//  DateString+Formatter.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import Foundation

fileprivate let locale = Locale(identifier: "en_US_POSIX")
fileprivate let timezone = TimeZone(secondsFromGMT: 0)

extension Date {
    var startOfWeek: Date? {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = locale
        calendar.timeZone = timezone ?? calendar.timeZone
        guard let date = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return calendar.date(byAdding: .day, value: 1, to: date)
    }
}

extension String {
    
    func apiString2date() -> Date? {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        df.timeZone = timezone
        df.locale = locale
        return df.date(from: self)
    }
    
}

extension Date {
    
    func apiDate2string() -> String? {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        df.timeZone = timezone
        df.locale = locale
        return df.string(from: self)
    }
    
    func uiTitleDate2string() -> String? {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        df.timeZone = timezone
        df.locale = locale
        return df.string(from: self)
    }
    
    func uiTableHeadersDate2string() -> String? {
        let df = DateFormatter()
        df.dateFormat = "dd.MM EEEE"
        df.timeZone = timezone
        df.locale = locale
        return df.string(from: self)
    }
    
    func dayOfWeek() -> String? {
        let df = DateFormatter()
        df.dateFormat = "EEEE"
        df.timeZone = timezone
        df.locale = locale
        return df.string(from: self)
    }
}

extension Int {
    
    func dayOfWeek() -> String? {
        let shift4monday = 3
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = locale
        calendar.timeZone = timezone ?? calendar.timeZone
        var components = calendar.dateComponents([.weekday], from: Date(timeIntervalSince1970: 0))
        components.day = shift4monday + self
        
        return calendar.date(from: components)?.dayOfWeek()
    }
    
}
