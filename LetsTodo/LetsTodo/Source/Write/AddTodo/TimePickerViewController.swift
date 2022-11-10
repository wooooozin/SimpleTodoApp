//
//  TimePickerViewController.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/08.
//

import UIKit
import SnapKit

protocol DatePickerViewDelegate: AnyObject {
    func updateDateTime(_ dateTime: String)
}

final class TimePickerViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: DatePickerViewDelegate?
    
    private let datePicker = UIDatePicker()
    private let topContainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var saveDateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(
            self,
            action: #selector(saveDateButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(
            self,
            action: #selector(closeButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConcentraints()
        setUpDatePicker()
    }
}

// MARK: - Method

extension TimePickerViewController {
    private func setConcentraints() {
        view.backgroundColor = .clear.withAlphaComponent(0.5)
        view.addSubview(datePicker)
        view.addSubview(topContainView)
        topContainView.addSubview(saveDateButton)
        topContainView.addSubview(closeButton)
        
        datePicker.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        topContainView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(datePicker.snp.top)
        }
        
        closeButton.snp.makeConstraints { make in
            make.leading.equalTo(topContainView.snp.leading).offset(20)
            make.top.equalTo(topContainView.snp.top).offset(10)
            make.bottom.equalTo(topContainView.snp.bottom).offset(-10)
            make.centerY.equalTo(topContainView.snp.centerY)
            make.width.equalTo(80)
        }
        
        saveDateButton.snp.makeConstraints { make in
            make.trailing.equalTo(topContainView.snp.trailing).offset(-20)
            make.top.equalTo(topContainView.snp.top).offset(10)
            make.bottom.equalTo(topContainView.snp.bottom).offset(-10)
            make.centerY.equalTo(topContainView.snp.centerY)
            make.width.equalTo(80)
        }
    }
    
    private func setUpDatePicker() {
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .white
        datePicker.sizeToFit()
    }
    
    @objc private func saveDateButtonTapped() {
        let dateformatter = DateFormatter()
        dateformatter.amSymbol = "AM"
        dateformatter.pmSymbol = "PM"
        dateformatter.dateFormat = "a hh:mm"
        let date = dateformatter.string(from: datePicker.date)
        self.delegate?.updateDateTime(date)
        self.dismiss(animated: true)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}
