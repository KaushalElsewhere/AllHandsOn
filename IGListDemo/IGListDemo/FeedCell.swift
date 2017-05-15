//
//  FeedCell.swift
//  IGListDemo
//
//  Created by Kaushal Elsewhere on 17/03/2017.
//  Copyright © 2017 Kaushal Elsewhere. All rights reserved.
//

import UIKit


class FeedCell: CollectionCell {
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .Center
        label.textColor = .blackColor()
        return label
    }()
    
    override func setupViews() {
        contentView.addSubview(label)
        contentView.backgroundColor = .whiteColor()
        label.center = contentView.center
    }
}

