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
    let todoManager = CoreDataManager.shared
    var selectedDate: Date?
    
    private lazy var pullDownButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = writeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpDatas()
        setUpTableView()
        setUpCalendarView()
        writeView.writeButton.addTarget(self, action: #selector(writeButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.writeView.tableView.reloadData()
            self.writeView.calendarView.reloadData()
        }
        print(todoManager.getTodoSavedArrayFromCoreData().count)
        print(todoManager.searchDateTodoFromCoreData(date: selectedDate ?? Date()).count)
    }
}

// MARK: - Method
extension WriteViewController {
    private func setUpNavigationBar() {
        let editAction = UIAction(
            title: "finish",
            image: UIImage(systemName: "app.badge.checkmark"),
            handler: { _ in
                print("1")
            }
        )
        let deleteAction = UIAction(
            title: "Delete",
            image: UIImage(systemName: "trash"),
            handler: { _ in
                print("2")
                self.writeView.tableView.setEditing(true, animated: true)
            }
        )
        pullDownButton.menu = UIMenu(title: "", options: .displayInline, children: [editAction, deleteAction])
        setNavigationTitleDay(date: Date())
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: pullDownButton)
    }
    
    private func setUpDatas() {
        self.selectedDate = Date()
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
    
    @objc private func writeButtonTapped() {
        print(#function)
        let vc = UINavigationController(rootViewController: AddTodoViewController())
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension WriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoManager.searchDateTodoFromCoreData(date: selectedDate ?? Date()).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "WriteCell"
        ) as? WriteCell else {
            return UITableViewCell()
        }
        let todoSaved = self.todoManager.searchDateTodoFromCoreData(date: selectedDate ?? Date())[indexPath.row]
        cell.selectionStyle = .none
        cell.todo = todoSaved
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
        selectedDate = date
        print(selectedDate)
        DispatchQueue.main.async {
            self.writeView.tableView.reloadData()
        }
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if todoManager.searchDateTodoFromCoreData(date: date).count != 0 {
            return 1
        }
        return 0
    }
}


