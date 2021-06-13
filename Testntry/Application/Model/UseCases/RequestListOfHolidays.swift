//
//  RequestListOfHolidays.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

class RequestListOfHolidays {
    
    func request(comlition: @escaping ((_: Result<[DayInfo], Error>)) -> Void) {
        Assembly.shared.holidaysApiService().read { result in
            
        }
    }
    
}
