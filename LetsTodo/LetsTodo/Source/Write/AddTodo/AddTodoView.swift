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
        tf.borderStyle = .none
        tf.textColor = .black
        tf.tintColor = .black
        tf.autocapitalizationType = .none
        tf.font = UIFont.boldSystemFont(ofSize: 14)
        tf.placeholder = " Write your task title here"
        return tf
    }()
    
    let bindLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
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
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "stopwatch.fill")
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: "  Task Time"))
        label.attributedText = attributedString
        label.tintColor = .black
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var timeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .systemGray
        button.setTitle("10:00 PM", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.semanticContentAttribute = .forceLeftToRight
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .leading
        return button
    }()
    
    private let notiLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "bell.fill")
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: "  Notification"))
        label.attributedText = attributedString
        label.tintColor = .black
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var notiButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.tintColor = .systemGray
        button.setTitle("in 5 min", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .leading
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
    
    private let textContainView: UIStackView = {
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
    
    private let timeContainView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 5
        sv.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        return sv
    }()
    
    private let notiContainView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 5
        sv.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
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
        stackView.addArrangedSubview(calendarView)
        stackView.addArrangedSubview(textContainView)
        stackView.addArrangedSubview(timeContainView)
        stackView.addArrangedSubview(notiContainView)
        
        textContainView.addArrangedSubview(titleTextField)
        textContainView.addArrangedSubview(bindLineView)
        textContainView.addArrangedSubview(memoTextView)
        
        timeContainView.addArrangedSubview(timeLabel)
        timeContainView.addArrangedSubview(timeButton)
        
        notiContainView.addArrangedSubview(notiLabel)
        notiContainView.addArrangedSubview(notiButton)
        
        stackView.backgroundColor = .white
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        calendarView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        textContainView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(textContainView.snp.top).offset(10)
            make.leading.equalTo(textContainView.snp.leading).offset(10)
            make.trailing.equalTo(textContainView.snp.trailing).offset(-10)
        }
        
        bindLineView.snp.makeConstraints { make in
            make.height.equalTo(1.0)
            make.leading.equalTo(textContainView.snp.leading).offset(10)
            make.trailing.equalTo(textContainView.snp.trailing).offset(-10)
        }
    }
}
