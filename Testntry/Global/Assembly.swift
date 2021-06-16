//
//  Assembly.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

class Assembly {
    
    static var shared: Assembly = Assembly()
    
    // MARK: - Services
    func holidaysApiService() -> HolidaysAPIServiceProtocol { HolidaysAPIService() }
    private var holidaysState = MainDateRangeStateService()
    func holidaysStateService() -> MainDateRangeStateService { return holidaysState }
    
    // MARK: - UseCases
    func requestHolidaysUseCase() -> RequestListOfHolidaysUseCase {
        RequestListOfHolidaysUseCase(apiService: holidaysApiService(),
                                     stateService: holidaysStateService())
    }
    func changeWeekToNextUseCase() -> ChangeDateWeakToNextUseCase {
        ChangeDateWeakToNextUseCase(stateService: holidaysStateService())
    }
    func changeWeekToPrevUseCase() -> ChangeDateWeakToPrevUseCase {
        ChangeDateWeakToPrevUseCase(stateService: holidaysStateService())
    }
    func updateFirstDateUseCase() -> UpdateFirstDateUseCase {
        UpdateFirstDateUseCase(stateService: holidaysStateService())
    }
    
    // MARK: - Presenters
    func mainPresenter() -> MainPresenter {
        MainPresenter(holidaysUseCase: requestHolidaysUseCase(),
                      changeWeekPrevUseCase: changeWeekToPrevUseCase(),
                      changeWeekNextUseCase: changeWeekToNextUseCase(),
                      updateFirstDateUseCase: updateFirstDateUseCase())
    }
    
    // MARK: - Stylers
    func launchStyler() -> LaunchStyler { LaunchStyler() }
    func mainStyler() -> MainStyler { MainStyler() }
    
    // MARK: - Coordinators
    func launchCoordinator(nvc: BaseNVC) -> LaunchCoordinator { LaunchCoordinator(navigationController: nvc) }
    
}
