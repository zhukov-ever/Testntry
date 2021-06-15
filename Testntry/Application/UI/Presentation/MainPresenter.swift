//
//  MainPresenter.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import Foundation

enum MainPresenterViewOutput {
    case viewDidLoad
    case pressPrevDates
    case pressNextDates
}

enum MainPresenterViewInput {
    case didLoadHolidays(HolidaysAppState, [DayInfo])
    case error(Error)
}

class MainPresenter {
    internal init(holidaysUseCase: RequestListOfHolidaysUseCase, changeWeekPrevUseCase: ChangeDateWeakToPrevUseCase, changeWeekNextUseCase: ChangeDateWeakToNextUseCase, complition: ((MainPresenter.Input) -> Void)? = nil) {
        self.holidaysUseCase = holidaysUseCase
        self.changeWeekPrevUseCase = changeWeekPrevUseCase
        self.changeWeekNextUseCase = changeWeekNextUseCase
        self.complition = complition
    }
    
    
    typealias Input = MainPresenterViewInput
    typealias Output = MainPresenterViewOutput
    
    var holidaysUseCase: RequestListOfHolidaysUseCase
    var changeWeekPrevUseCase: ChangeDateWeakToPrevUseCase
    var changeWeekNextUseCase: ChangeDateWeakToNextUseCase
    
    var complition: ((Input) -> Void)?
    func handle(output: Output) {
        switch output {
        case .pressPrevDates:
            changeWeekPrevUseCase.request { [weak self] result in
                switch result {
                case .success:
                    self?.loadAndNotify()
                case .failure(let error):
                    self?.complition?(.error(error))
                }
            }
        case .pressNextDates:
            changeWeekNextUseCase.request { [weak self] result in
                switch result {
                case .success:
                    self?.loadAndNotify()
                case .failure(let error):
                    self?.complition?(.error(error))
                }
            }
        case .viewDidLoad:
            loadAndNotify()
        }
    }
    
    private func loadAndNotify() {
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
