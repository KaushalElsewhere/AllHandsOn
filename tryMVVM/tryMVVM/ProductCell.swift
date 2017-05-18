//
//  ProductCell.swift
//  tryMVVM
//
//  Created by Kaushal Elsewhere on 15/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//
import UIKit
import Foundation
import SnapKit

extension ProductCell {
    func setupDataWith(viewModel: ProductViewModel) {
        self.nameLabel.text = viewModel.
    }
}

extension ProductCell {
    override func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(subtitleLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        let superView = contentView
        nameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(superView).offset(15)
            make.left.equalTo(superView).offset(20)
        }
        subtitleLabel.snp_makeConstraints { (make) in
            make.top.equalTo(superView).offset(20)
            make.left.equalTo(superView).offset(20)
            make.bottom.equalTo(superView).offset(-15)
        }
    }
}

class ProductCell: TableViewCell {
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticNueue", size: 20)
        label.textColor = .blackColor()
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticNueue", size: 14)
        label.textColor = .blackColor()

        return label
    }()
}



