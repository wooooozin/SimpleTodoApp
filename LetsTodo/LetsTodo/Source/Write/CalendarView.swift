//
//  CalendarView.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/05.
//

import UIKit
import FSCalendar

class CalendarView: FSCalendar {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        appearance.todayColor = UIColor(red: 255/255, green: 164/255, blue: 108/255, alpha: 1.0)
        appearance.selectionColor = UIColor(red: 255/255, green: 164/255, blue: 108/255, alpha: 0.5)
        appearance.eventDefaultColor = UIColor(red: 79/255, green: 197/255, blue: 237/255, alpha: 1.0)
        appearance.borderRadius = 0.5
        layer.cornerRadius = 30
        clipsToBounds = true
        headerHeight = 40
        appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 12)
        appearance.headerTitleColor = .systemGray
        appearance.weekdayTextColor = .systemGray
        appearance.headerDateFormat = "MMMM, y"
        appearance.headerMinimumDissolvedAlpha = 0.0
        appearance.weekdayFont = UIFont.systemFont(ofSize: 12)
        appearance.titleFont = UIFont.boldSystemFont(ofSize: 16)
        calendarWeekdayView.weekdayLabels[0].text = "S"
        calendarWeekdayView.weekdayLabels[1].text = "M"
        calendarWeekdayView.weekdayLabels[2].text = "T"
        calendarWeekdayView.weekdayLabels[3].text = "W"
        calendarWeekdayView.weekdayLabels[4].text = "T"
        calendarWeekdayView.weekdayLabels[5].text = "F"
        calendarWeekdayView.weekdayLabels[6].text = "S"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
