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
        let calendar = CalendarView()
        return calendar
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
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
