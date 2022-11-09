//
//  NotiPickerViewController.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/08.
//

import UIKit
import SnapKit

protocol NotiPickerViewDelegate: AnyObject {
    func updateNotiText(_ text: String)
}

final class NotiPickerViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: NotiPickerViewDelegate?
    private var notiTime: String?
    private let notiTimeList = NotificationTime.allCases
    
    private let notiPicker = UIPickerView()
    private let topContainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var saveNotiButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(
            self,
            action: #selector(saveNotiButtonTapped),
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
        setUpNotiPicker()
    }
}

// MARK: - Properties

extension NotiPickerViewController {
    private func setConcentraints() {
        
        view.backgroundColor = .clear.withAlphaComponent(0.5)
        view.addSubview(notiPicker)
        view.addSubview(topContainView)
        topContainView.addSubview(saveNotiButton)
        topContainView.addSubview(closeButton)
        
        notiPicker.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        topContainView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(notiPicker.snp.top)
        }
        
        closeButton.snp.makeConstraints { make in
            make.leading.equalTo(topContainView.snp.leading).offset(20)
            make.top.equalTo(topContainView.snp.top).offset(10)
            make.bottom.equalTo(topContainView.snp.bottom).offset(-10)
            make.centerY.equalTo(topContainView.snp.centerY)
            make.width.equalTo(80)
        }
        
        saveNotiButton.snp.makeConstraints { make in
            make.trailing.equalTo(topContainView.snp.trailing).offset(-20)
            make.top.equalTo(topContainView.snp.top).offset(10)
            make.bottom.equalTo(topContainView.snp.bottom).offset(-10)
            make.centerY.equalTo(topContainView.snp.centerY)
            make.width.equalTo(80)
        }
    }
    
    private func setUpNotiPicker() {
        notiPicker.backgroundColor = .white
        notiPicker.sizeToFit()
        notiPicker.delegate = self
        notiPicker.dataSource = self
    }
    
    @objc private func saveNotiButtonTapped() {
        self.delegate?.updateNotiText(notiTime ?? NotificationTime.onTime.notiString)
        self.dismiss(animated: true)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}

// MARK: -

extension NotiPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return notiTimeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return notiTimeList[row].notiString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.notiTime = notiTimeList[row].notiString
    }
}
