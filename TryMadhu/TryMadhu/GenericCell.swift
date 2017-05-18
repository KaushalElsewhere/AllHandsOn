//
//  GenericCell.swift
//  TryMadhu
//
//  Created by Kaushal Elsewhere on 15/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}

