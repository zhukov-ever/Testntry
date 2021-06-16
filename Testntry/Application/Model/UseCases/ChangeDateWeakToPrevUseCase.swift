//
//  ChangeDateWeakToPrevUseCase.swift
//  Testntry
//
//  Created by kokozzz on 15.06.2021.
//

import Foundation

class ChangeDateWeakToPrevUseCase {
    
    init(stateService: MainDateRangeStateService) {
        self.stateService = stateService
    }
    
    var stateService: MainDateRangeStateService
    
    func request(comlition: @escaping ( _: Result<Void, Error>) -> Void) {
        let state = stateService.state
        guard let endDate = state.endDate.apiString2date(),
              let startDate = state.startDate.apiString2date() else {
            comlition(.failure(ModelErrors.unknownError))
            return
        }
        
        guard let newEndDate = Calendar.current.date(byAdding: .day, value: -AppParams.daysRangeAtHome, to: endDate)?.apiDate2string(),
              let newStartDate = Calendar.current.date(byAdding: .day, value: -AppParams.daysRangeAtHome, to: startDate)?.apiDate2string() else {
            comlition(.failure(ModelErrors.unknownError))
            return
        }
        
        stateService.state = MainDateRangeState(startDate: newStartDate, endDate: newEndDate, firstDay: state.firstDay)
        comlition(.success(Void()))
    }
    
}
