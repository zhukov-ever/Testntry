//
//  RequestListOfHolidays.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

struct RequestListOfHolidays {
    
    var service: HolidaysAPIServiceProtocol
    
    func request(comlition: @escaping ((_: Result<[DayInfo], Error>)) -> Void) {
        Assembly.shared.holidaysApiService().read { result in
            switch result {
            case .success(let response):
                comlition(.success(response.map2appModel()))
            case .failure(let error):
                comlition(.failure(error))
            }
        }
    }
    
}
