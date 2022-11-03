//
//  WriteViewController.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/03.
//

import UIKit
import FSCalendar

final class WriteViewController: UIViewController {
    
    // MARK: - Properties
    
    private let writeView = WriteView()

    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = writeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableView()
        setUpCalendarView()
    }
}

// MARK: - Method
extension WriteViewController {
    private func setUpNavigationBar() {
        setNavigationTitleDay(date: Date())
    }
    
    private func setUpTableView() {
        writeView.tableView.dataSource = self
        writeView.tableView.delegate = self
        writeView.tableView.register(WriteCell.self, forCellReuseIdentifier: "WriteCell")
    }
    
    private func setUpCalendarView() {
        writeView.calendarView.delegate = self
        writeView.calendarView.dataSource = self
    }
    
    private func setNavigationTitleDay(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        self.navigationItem.title = dateFormatter.string(from: date)
    }
}

// MARK: - UITableViewDataSource

extension WriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "WriteCell"
        ) as? WriteCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate

extension WriteViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 130
    }
    
    func tableView(
        _ tableView: UITableView,
        estimatedHeightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - FSCalendarDelegate, FSCalendarDataSource

extension WriteViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        setNavigationTitleDay(date: date)
    }
}
