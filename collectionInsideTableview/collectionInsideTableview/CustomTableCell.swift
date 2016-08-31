//
//  CustomTableCell.swift
//  collectionInsideTableview
//
//  Created by Kaushal Elsewhere on 31/08/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
extension CustomTableCell: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(UICollectionViewCell.reuseid, forIndexPath: indexPath)
        cell.backgroundColor = .greenColor()
        
        return cell
    }
}

class CustomTableCell: UITableViewCell {

    var layout: UICollectionViewLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 80, height: 80)
        
        return layout
    }
    
    lazy var collectionView: UICollectionView = {
        let collection:UICollectionView = UICollectionView(frame: self.contentView.frame, collectionViewLayout: self.layout)
        collection.backgroundColor = .redColor()
        collection.scrollEnabled = false
        return collection
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .None
        
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.reuseid)
        collectionView.dataSource = self
        
        
        contentView.addSubview(collectionView)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        let superView = contentView
        
        collectionView.snp_makeConstraints { (make) in
            make.left.equalTo(superView).offset(10)
            make.top.equalTo(superView).offset(10)
            make.right.equalTo(superView).offset(-10)
            make.bottom.equalTo(superView).offset(-10)
            make.height.equalTo(500)
        }
    }

}
