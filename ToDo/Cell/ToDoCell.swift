//
//  ToDoCell.swift
//  ToDo
//
//  Created by NHN on 2023/03/30.
//

import Foundation
import UIKit


class ToDoCell: UITableViewCell {
    
    var checkboxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        button.tintColor = .systemBlue
        return button
    }()
    
    var toDoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(checkboxButton)
        contentView.addSubview(toDoLabel)
        
        checkboxButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        toDoLabel.snp.makeConstraints { make in
            make.leading.equalTo(checkboxButton.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        checkboxButton.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with todo: ToDo) {
        toDoLabel.text = todo.text
        checkboxButton.isSelected = todo.isCompleted
    }
    
    @objc func checkBoxTapped() {
        
    }
}
