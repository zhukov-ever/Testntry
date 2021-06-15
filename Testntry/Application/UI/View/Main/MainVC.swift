//
//  MainVC.swift
//  Testntry
//
//  Created by kokozzz on 13.06.2021.
//

import UIKit

class MainVC: BaseVC {
    
    var kTableHeaderHeight: CGFloat = 128.0
    
    var dataSource: MainTableViewDataSource!
    var presenter: MainPresenter!
    var coordinateFinishLoading: (() -> Void)?
    
    @IBOutlet weak var labelDateRange: UILabel!
    @IBOutlet weak var buttonPrev: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var labelFirstDaytitle: UILabel!
    @IBOutlet weak var buttonFirstDaySelector: UIButton!
    
    @IBOutlet weak var tableHeader: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinateFinishLoading?()
        
        configureUI()
        configureContent()
        configurePresenter()
    }
    
    
}

// MARK: - handlers
extension MainVC {
    
    @IBAction func prevDatesHandler(_ sender: Any) {
        presenter.handle(output: .pressPrevDates)
    }
    
    @IBAction func nextDatesHandler(_ sender: Any) {
        presenter.handle(output: .pressNextDates)
    }
    
}

// MARK: - private
extension MainVC {
    
    fileprivate func configureUI() {
        labelDateRange.text = L10n.Screen.Main.dateRange(L10n.Data.empty, L10n.Data.empty)
        buttonPrev.setTitle(L10n.Screen.Main.buttonPrev, for: .normal)
        buttonNext.setTitle(L10n.Screen.Main.buttonNext, for: .normal)
        labelFirstDaytitle.text = L10n.Screen.Main.firstDayTitle
        buttonFirstDaySelector.setTitle(L10n.Data.empty, for: .normal)
    }
    
    fileprivate func configurePresenter() {
        presenter.complition = { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .didLoadHolidays(let state, let days):
                self.fillUI(days: days)
                self.fillUI(state: state)
            case .error(let error):
                print(error)
            }
        }
        presenter.handle(output: .viewDidLoad)
    }
 
    fileprivate func configureContent() {
        dataSource = MainTableViewDataSource(tableView: tableView, styler: styler)
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
    
    fileprivate func fillUI(state: HolidaysAppState) {
        labelDateRange.text = L10n.Screen.Main.dateRange(state.startDate4title,
                                                         state.endDate4title)
        buttonFirstDaySelector.setTitle(state.firstDay4title, for: .normal)
    }
    
    fileprivate func fillUI(days: [DayInfo]) {
        self.dataSource.elements = days
    }
    
}


// MARK: - table data source
class MainTableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let styler: Styling
    let tableView: UITableView
    init(tableView: UITableView, styler: Styling) {
        tableView.register(cellType: FolkHolidayCell.self)
        tableView.register(cellType: PublicHoilidayCell.self)
        tableView.register(cellType: NoEventsCell.self)
        
        self.tableView = tableView
        self.styler = styler
    }
    
    var elements: [DayInfo] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MainSectionHeaderView.loadFromNibOrInit()
        header.styler = styler
        header.element = elements[section]
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements[section].holidays.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = elements[indexPath.section].holidays[indexPath.row]
        
        switch element.type {
        case .folk:
            let cell: FolkHolidayCell = tableView.dequeue(indexPath: indexPath)
            cell.styler = styler
            cell.element = elements[indexPath.section].holidays[indexPath.row]
            return cell
        case .public:
            let cell: PublicHoilidayCell = tableView.dequeue(indexPath: indexPath)
            cell.styler = styler
            cell.element = elements[indexPath.section].holidays[indexPath.row]
            return cell
        }
    }
}
