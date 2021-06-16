//
//  UpdateFirstDateUseCase.swift
//  Testntry
//
//  Created by kokozzz on 16.06.2021.
//

import Foundation

class UpdateFirstDateUseCase {
    
    init(stateService: MainDateRangeStateService) {
        self.stateService = stateService
    }
    
    var stateService: MainDateRangeStateService
    
    func request(dayIndex: Int, comlition: @escaping ( _: Result<Void, Error>) -> Void) {
        let state = stateService.state
        
        let initialDate = state.startDate.apiString2date()?.startOfWeek ?? Date()
        let startDate = Calendar.current.date(byAdding: .day, value: dayIndex,
                                              to: initialDate)?.apiDate2string() ?? L10n.Data.empty
        
        let endDate = Calendar.current.date(byAdding: .day, value: AppParams.daysRangeAtHome - 1 + dayIndex,
                                            to: initialDate)?.apiDate2string() ?? L10n.Data.empty
        
        stateService.state = MainDateRangeState(startDate: startDate, endDate: endDate, firstDay: dayIndex)
        
        comlition(.success(Void()))
    }
}
