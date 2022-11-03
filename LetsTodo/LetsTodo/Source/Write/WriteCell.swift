//
//  WriteCell.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/03.
//

import UIKit

final class WriteCell: UITableViewCell {
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(
                top: 10,
                left: 20,
                bottom: 10,
                right: 20
            )
        )
        contentView.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = self.frame.height * 0.2
    }
}
