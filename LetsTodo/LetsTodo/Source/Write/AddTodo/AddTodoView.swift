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
    
    var calendarHeight: NSLayoutConstraint!

    var calendarView: FSCalendar = {
        let calendar = CalendarView()
        calendar.layer.cornerRadius = 20
        calendar.scope = .week
        calendar.appearance.headerTitleColor = .black
        calendar.calendarWeekdayView.weekdayLabels[0].text = "S"
        calendar.calendarWeekdayView.weekdayLabels[1].text = "M"
        calendar.calendarWeekdayView.weekdayLabels[2].text = "T"
        calendar.calendarWeekdayView.weekdayLabels[3].text = "W"
        calendar.calendarWeekdayView.weekdayLabels[4].text = "T"
        calendar.calendarWeekdayView.weekdayLabels[5].text = "F"
        calendar.calendarWeekdayView.weekdayLabels[6].text = "S"
        return calendar
    }()
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        let spacer = UIView()
        spacer.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(40)
        }
        tf.leftView = spacer
        tf.leftViewMode = .always
        tf.borderStyle = .none
        tf.textColor = .black
        tf.tintColor = .black
        tf.autocapitalizationType = .none
        tf.font = UIFont.boldSystemFont(ofSize: 14)
        tf.placeholder = " Write your task title here"
        return tf
    }()
    
    private let bindLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0
        )
        return view
    }()
    
    let memoTextView: UITextView = {
        let tv = UITextView()
        tv.textColor = .lightGray
        tv.tintColor = .lightGray
        tv.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        tv.font = UIFont.systemFont(ofSize: 12)
        tv.autocapitalizationType = .none
        tv.isScrollEnabled = true
        tv.text = "Write your task here"
        return tv
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Task Time"
        label.tintColor = .black
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let setTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let timeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "stopwatch.fill")
        return imageView
    }()
    
    lazy var setTimeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
        
    private let notiLabel: UILabel = {
        let label = UILabel()
        label.text = "Notification"
        label.tintColor = .black
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let setNotiLabel: UILabel = {
        let label = UILabel()
        label.text = "On the dot"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let notiImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "bell.fill")
        return imageView
    }()
    
    lazy var setNotiButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save Task", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.spacing = 20
        return sv
    }()
    
    private let textContainStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 5
        sv.clipsToBounds = true
        sv.layer.cornerRadius = 20
        sv.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        return sv
    }()
    
    private let timeContainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    private let notiContainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let buttonContainStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.backgroundColor = .white
        return sv
    }()

    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setConcentraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods

    private func setConcentraints() {
        self.addSubview(stackView)
        self.addSubview(timeContainView)
        self.addSubview(notiContainView)
        self.addSubview(buttonContainStackView)
        
        stackView.addArrangedSubview(calendarView)
        stackView.addArrangedSubview(textContainStackView)
        
        textContainStackView.addArrangedSubview(titleTextField)
        textContainStackView.addArrangedSubview(bindLineView)
        textContainStackView.addArrangedSubview(memoTextView)
        
        timeContainView.addSubview(timeImageView)
        timeContainView.addSubview(timeLabel)
        timeContainView.addSubview(setTimeLabel)
        timeContainView.addSubview(setTimeButton)
        
        notiContainView.addSubview(notiImageVIew)
        notiContainView.addSubview(notiLabel)
        notiContainView.addSubview(setNotiLabel)
        notiContainView.addSubview(setNotiButton)
        
        buttonContainStackView.addArrangedSubview(closeButton)
        buttonContainStackView.addArrangedSubview(saveButton)

        
        // MARK: - Layout

        stackView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.bottom.equalTo(timeContainView.snp.top).offset(-20)
        }
        
        calendarView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        bindLineView.snp.makeConstraints { make in
            make.height.equalTo(1.0)
        }
        
        timeContainView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(notiContainView.snp.top).offset(-20)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        timeImageView.snp.makeConstraints { make in
            make.leading.equalTo(timeContainView.snp.leading).offset(30)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(timeImageView.snp.trailing).offset(10)
            make.centerY.equalTo(timeImageView.snp.centerY)
            make.top.equalTo(timeContainView.snp.top).offset(20)
            make.bottom.equalTo(timeContainView.snp.bottom).offset(-20)
        }
        
        setTimeButton.snp.makeConstraints { make in
            make.trailing.equalTo(timeContainView.snp.trailing).offset(-30)
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
        
        setTimeLabel.snp.makeConstraints { make in
            make.trailing.equalTo(setTimeButton.snp.leading).offset(-10)
            make.centerY.equalTo(setTimeButton.snp.centerY)
            make.top.equalTo(timeContainView.snp.top).offset(20)
            make.bottom.equalTo(timeContainView.snp.bottom).offset(-20)
        }
        
        notiContainView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.top.equalTo(timeContainView.snp.bottom).offset(20)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
        
        notiImageVIew.snp.makeConstraints { make in
            make.leading.equalTo(notiContainView.snp.leading).offset(30)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        notiLabel.snp.makeConstraints { make in
            make.leading.equalTo(notiImageVIew.snp.trailing).offset(10)
            make.centerY.equalTo(notiImageVIew.snp.centerY)
            make.top.equalTo(notiContainView.snp.top).offset(20)
            make.bottom.equalTo(notiContainView.snp.bottom).offset(-20)
        }
        
        setNotiButton.snp.makeConstraints { make in
            make.trailing.equalTo(notiContainView.snp.trailing).offset(-30)
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
        
        setNotiLabel.snp.makeConstraints { make in
            make.trailing.equalTo(setNotiButton.snp.leading).offset(-10)
            make.centerY.equalTo(setNotiButton.snp.centerY)
            make.top.equalTo(notiContainView.snp.top).offset(20)
            make.bottom.equalTo(notiContainView.snp.bottom).offset(-20)
        }
        
        buttonContainStackView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(notiContainView.snp.bottom).offset(20)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
        }
    }
}
