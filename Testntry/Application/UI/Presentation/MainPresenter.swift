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
    case updateFirstDate(Int)
}

enum MainPresenterViewInput {
    case didLoadHolidays(MainDateRangeState, [DayInfo])
    case error(Error)
}

class MainPresenter {
    internal init(holidaysUseCase: RequestListOfHolidaysUseCase, changeWeekPrevUseCase: ChangeDateWeakToPrevUseCase, changeWeekNextUseCase: ChangeDateWeakToNextUseCase, updateFirstDateUseCase: UpdateFirstDateUseCase, complition: ((MainPresenter.Input) -> Void)? = nil) {
        self.holidaysUseCase = holidaysUseCase
        self.changeWeekPrevUseCase = changeWeekPrevUseCase
        self.changeWeekNextUseCase = changeWeekNextUseCase
        self.updateFirstDateUseCase = updateFirstDateUseCase
        self.complition = complition
    }    
    
    typealias Input = MainPresenterViewInput
    typealias Output = MainPresenterViewOutput
    
    var holidaysUseCase: RequestListOfHolidaysUseCase
    var changeWeekPrevUseCase: ChangeDateWeakToPrevUseCase
    var changeWeekNextUseCase: ChangeDateWeakToNextUseCase
    var updateFirstDateUseCase: UpdateFirstDateUseCase
    
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
        case .updateFirstDate(let dayIndex):
            updateFirstDateUseCase.request(dayIndex: dayIndex) { [weak self] _ in
                self?.loadAndNotify()
            }
        }
    }
    
    private func loadAndNotify() {
        holidaysUseCase.request { [weak self] state, result in
            guard let self = self else { return }
            
            switch result {
            case .success(let days):
                let daysByDate = days
                    .reduce(into: [String:DayInfo]()) { $0[$1.dateString] = $1 }
                let dayList: [DayInfo] = self.createDaysList(state: state)
                    .map { DayInfo(dateString: $0, holidays: daysByDate[$0]?.holidays ) }
                
                self.complition?(.didLoadHolidays(state, dayList))
            case .failure(let error):
                self.complition?(.error(error))
            }
        }
    }
    
    private func createDaysList(state: MainDateRangeState) -> [String] {
        guard let startDate = state.startDate.apiString2date() else { return [] }
        guard let endDate = state.endDate.apiString2date() else { return [] }
        
        var dates: [Date] = [startDate]
        let calendar = Calendar.current
        
        while true {
            guard let lastDate = dates.last else {
                break
            }
            let newDate = calendar.date(byAdding: .day, value: 1, to: lastDate)

            if let newDate = newDate, newDate.compare(endDate) == .orderedAscending {
                dates.append(newDate)
            } else {
                dates.append(endDate)
                break
            }
        }
        
        return dates.compactMap { $0.apiDate2string() }
    }
    
}
