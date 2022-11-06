//
//  AddTodoView.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/05.
//

import UIKit
import SnapKit
import FSCalendar

class AddTodoView: UIView {
    
    // MARK: - Properties

    var calendarView: FSCalendar = {
        let calendar = CalendarView()
        calendar.scope = .week
        calendar.appearance.headerTitleColor = .black
        return calendar
    }()
    
}
