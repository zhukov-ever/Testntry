//
//  RequestListOfHolidays.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

class RequestListOfHolidaysUseCase {
    
    init(apiService: HolidaysAPIServiceProtocol, stateService: HolidaysStateService) {
        self.apiService = apiService
        self.stateService = stateService
    }
    
    var apiService: HolidaysAPIServiceProtocol
    var stateService: HolidaysStateService
    
    func request(comlition: @escaping (_: HolidaysAppState, _: Result<[DayInfo], Error>) -> Void) {
        Assembly.shared.holidaysApiService().read(startDate: stateService.state.startDate,
                                                  endDate: stateService.state.endDate) { result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    comlition(self.stateService.state, .success(response.map2appModel()))
                case .failure(let error):
                    comlition(self.stateService.state, .failure(error))
                }
            }
        }
    }
    
}
