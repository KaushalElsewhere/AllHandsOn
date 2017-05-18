//
//  SettingsCell.swift
//  TryMadhu
//
//  Created by Kaushal Elsewhere on 15/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit

class SettingsCell: TableCell {
    lazy var usernameTextFild: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.textColor = .darkGrayColor()
        return textField
    }()
    
    
    override func setupViews() {
        contentView.addSubview(usernameTextFild)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        let superView = contentView
        
        usernameTextFild.snp_makeConstraints { (make) in
            make.left.equalTo(superView).offset(20)
            make.top.equalTo(superView).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
    }
}
