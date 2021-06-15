//
//  HolidaysAPIServiceProtocol.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

protocol HolidaysAPIServiceProtocol {
    func read(startDate: String,
              endDate: String,
              complition: @escaping ((_: Result<[String: [HolidayByDayResponseModel]], Error>) -> Void))
}
