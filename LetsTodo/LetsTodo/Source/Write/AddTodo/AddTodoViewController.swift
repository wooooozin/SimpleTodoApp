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
    var dateTime: String?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = addTodoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpCalendarView()
        setUpButtonAction()
        setUpDatas()
    }
}

// MARK: - Method
extension AddTodoViewController {
    private func setUpNavigationBar() {
        self.navigationItem.title = "Add new task"
    }
    
    private func setUpDatas() {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
        let date = dateformatter.string(from: Date())
        self.dateTime = date
        addTodoView.setTimeLabel.text = dateTime
        addTodoView.setNotiLabel.text = NotificationTime.onTime.notiString
    }
    
    private func setUpCalendarView() {
        addTodoView.calendarView.delegate = self
        addTodoView.calendarView.dataSource = self
    }
        
    private func setUpButtonAction() {
        addTodoView.closeButton.addTarget(
            self,
            action: #selector(closeButtonTapped),
            for: .touchUpInside
        )
        
        addTodoView.saveButton.addTarget(
            self,
            action: #selector(saveButtonTapped),
            for: .touchUpInside
        )
        
        addTodoView.setTimeButton.addTarget(
            self,
            action: #selector(setTimeButtonTapped),
            for: .touchUpInside
        )
        
        addTodoView.setNotiButton.addTarget(
            self,
            action: #selector(setNotiButtonTapped),
            for: .touchUpInside
        )
    }
    
    // MARK: - @objc Methods

    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        print(#function)
    }
    
    @objc private func setTimeButtonTapped() {
        print(#function)
        let vc = TimePickerViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @objc private func setNotiButtonTapped() {
        print(#function)
    }
}

// MARK: - DatePickerViewDelegate

extension AddTodoViewController: DatePickerViewDelegate {
    func updateDateTime(_ dateTime: String) {
        self.dateTime = dateTime
        addTodoView.setTimeLabel.text = dateTime
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
