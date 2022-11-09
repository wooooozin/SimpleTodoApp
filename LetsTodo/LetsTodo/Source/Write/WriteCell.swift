//
//  WriteCell.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/03.
//

import UIKit
import SnapKit

final class WriteCell: UITableViewCell {
    
    // MARK: - Properties
    
    var todo: Todo? {
        didSet {
            configureUIwithData()
        }
    }
    
    let doneLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 77/255, green: 139/255, blue: 82/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.text = "✓ DONE"
        label.isHidden = true
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private let memoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.spacing = 5
        return sv
    }()

    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConcentraints()
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(
                top: 10,
                left: 0,
                bottom: 10,
                right: 0
            )
        )
        contentView.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = self.frame.height * 0.2
    }
    
    // MARK: - Methods
    
    func setConcentraints() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(doneLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(memoLabel)
        stackView.addArrangedSubview(timeLabel)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
    
    func configureUIwithData() {
        guard let todo = todo else { return }
        titleLabel.text = todo.title
        memoLabel.text = todo.memo
        timeLabel.text = todo.time
    }
}
