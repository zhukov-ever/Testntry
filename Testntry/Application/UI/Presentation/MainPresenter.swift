//
//  MainPresenter.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

enum MainPresenterViewOutput {
    case viewDidLoad
}

enum MainPresenterViewInput {
    case didLoadHolidays(HolidaysAppState, [DayInfo])
    case error(Error)
}

class MainPresenter {
    
    typealias Input = MainPresenterViewInput
    typealias Output = MainPresenterViewOutput
    
    var holidaysUseCase: RequestListOfHolidaysUseCase
    internal init(holidaysUseCase: RequestListOfHolidaysUseCase) {
        self.holidaysUseCase = holidaysUseCase
    }
    
    var complition: ((Input) -> Void)?
    func handle(output: Output) {
        switch output {
        case .viewDidLoad:
            holidaysUseCase.request { [weak self] state, result in
                switch result {
                case .success(let days):
                    self?.complition?(.didLoadHolidays(state, days))
                case .failure(let error):
                    self?.complition?(.error(error))
                }
            }
        }
    }
    
}
