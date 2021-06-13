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
    func holidaysApiService() -> HolidaysAPIServiceProtocol { HolidaysAPIServiceExample() }
    
    // MARK: - UseCases
    func requestHolidaysUseCase() -> RequestListOfHolidays {
        RequestListOfHolidays(service: holidaysApiService())
    }
    
    // MARK: - Presenters
    func mainPresenter() -> MainPresenter {
        MainPresenter(holidaysUseCase: requestHolidaysUseCase())
    }
    
    // MARK: - Stylers
    func launchStyler() -> LaunchStyler { LaunchStyler() }
    func mainStyler() -> MainStyler { MainStyler() }
    
    // MARK: - Coordinators
    func launchCoordinator(nvc: BaseNVC) -> LaunchCoordinator { LaunchCoordinator(navigationController: nvc) }
    
}
