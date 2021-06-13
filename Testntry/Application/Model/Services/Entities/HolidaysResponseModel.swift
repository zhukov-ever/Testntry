//
//  HolidaysResponseModel.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

struct HolidaysRequestModel: Codable {
    let apiKey: String
    let startDate: String
    let endDate: String
}

struct HolidaysResponseModel: Codable {
    let error: Bool
    let holidays: [String: [HolidayByDayResponseModel]]?
    let reason: HolidayResponseErrorTypes?
}

struct HolidayByDayResponseModel: Codable {
    let name: String
    let type: HolidayResponseType
}

enum HolidayResponseType: String, CaseIterable, Codable {
    case folk
    case `public`
}

enum HolidayResponseErrorTypes: String, Error, CaseIterable, Codable {
    case invalidDates = "invalid-dates"
    case invalidApiKey = "invalid-api-key"
    case invalidRsequest = "invalid-request"
}
