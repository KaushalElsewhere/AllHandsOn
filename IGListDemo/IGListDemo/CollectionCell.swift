//
//  CollectionCell.swift
//  IGListDemo
//
//  Created by Kaushal Elsewhere on 17/03/2017.
//  Copyright © 2017 Kaushal Elsewhere. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CollectionCell {
    func setupViews() {
        
    }
}
