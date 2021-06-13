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
    case didLoadHolidays([DayInfo])
    case error(Error)
}

class MainPresenter {
    
    typealias Input = MainPresenterViewInput
    typealias Output = MainPresenterViewOutput
    
    var holidaysUseCase: RequestListOfHolidays
    internal init(holidaysUseCase: RequestListOfHolidays) {
        self.holidaysUseCase = holidaysUseCase
    }
    
    var complition: ((Input) -> Void)?
    func handle(output: Output) {
        switch output {
        case .viewDidLoad:
            holidaysUseCase.request { [weak self] result in
                switch result {
                case .success(let days):
                    self?.complition?(.didLoadHolidays(days))
                case .failure(let error):
                    self?.complition?(.error(error))
                }
            }
        }
    }
    
}
