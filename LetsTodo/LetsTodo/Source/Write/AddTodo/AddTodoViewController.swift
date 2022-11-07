//
//  AddTodoViewController.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/07.
//

import UIKit
import FSCalendar

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
    }
}

// MARK: - Method
extension AddTodoViewController {
    private func setUpNavigationBar() {
        self.navigationItem.title = "Add new task"
    }
}

