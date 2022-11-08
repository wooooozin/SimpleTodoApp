//
//  AddTodoViewController.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/07.
//

import UIKit
import FSCalendar
import SnapKit

final class AddTodoViewController: UIViewController {
    
    // MARK: - Properties
    
    private let addTodoView = AddTodoView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = addTodoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpCalendarView()
    }
}

// MARK: - Method
extension AddTodoViewController {
    private func setUpNavigationBar() {
        self.navigationItem.title = "Add new task"
    }
    
    private func setUpCalendarView() {
        addTodoView.calendarView.delegate = self
        addTodoView.calendarView.dataSource = self
    }
}

// MARK: - FSCalendarDelegate, FSCalendarDataSource

extension AddTodoViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendar.snp.updateConstraints { (make) in
            make.height.equalTo(bounds.height)
        }
        self.view.layoutIfNeeded()
    }

}
