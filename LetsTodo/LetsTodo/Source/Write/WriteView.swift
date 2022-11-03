//
//  WriteView.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/03.
//

import UIKit
import SnapKit
import FSCalendar

final class WriteView: UIView {
    
    // MARK: - Properties
    
    var calendarView: FSCalendar = {
        let calendar = FSCalendar()
        calendar.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        calendar.appearance.todayColor = UIColor(red: 255/255, green: 164/255, blue: 108/255, alpha: 1.0)
        calendar.appearance.selectionColor = UIColor(red: 255/255, green: 164/255, blue: 108/255, alpha: 0.5)
        calendar.appearance.eventDefaultColor = UIColor(red: 79/255, green: 197/255, blue: 237/255, alpha: 1.0)
        calendar.appearance.borderRadius = 0.5
        calendar.layer.cornerRadius = 30
        calendar.clipsToBounds = true
        calendar.headerHeight = 40
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 12)
        calendar.appearance.headerTitleColor = .systemGray
        calendar.appearance.weekdayTextColor = .systemGray
        calendar.appearance.headerDateFormat = "MMMM, y"
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 12)
        calendar.appearance.titleFont = UIFont.boldSystemFont(ofSize: 16)
        calendar.calendarWeekdayView.weekdayLabels[0].text = "S"
        calendar.calendarWeekdayView.weekdayLabels[1].text = "M"
        calendar.calendarWeekdayView.weekdayLabels[2].text = "T"
        calendar.calendarWeekdayView.weekdayLabels[3].text = "W"
        calendar.calendarWeekdayView.weekdayLabels[4].text = "T"
        calendar.calendarWeekdayView.weekdayLabels[5].text = "F"
        calendar.calendarWeekdayView.weekdayLabels[6].text = "S"
        return calendar
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    lazy var writeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        return button
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 10
        return sv
    }()
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConcentraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setConcentraints() {
        self.addSubview(stackView)
        self.addSubview(writeButton)
        stackView.addArrangedSubview(calendarView)
        stackView.addArrangedSubview(tableView)
        
        stackView.backgroundColor = .white
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        calendarView.snp.makeConstraints { make in
            make.height.equalTo(350)
        }
        
        writeButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
}
