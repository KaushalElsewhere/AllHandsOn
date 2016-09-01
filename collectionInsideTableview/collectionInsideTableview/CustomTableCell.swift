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
        //layout.estimatedItemSize = CGSizeMake(1, 1)
        
        return layout
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Other items by same user"
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection:UICollectionView = UICollectionView(frame: self.contentView.frame, collectionViewLayout: self.layout)
        collection.backgroundColor = .redColor()
        collection.scrollEnabled = false
        return collection
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .None
        
        //let flow: UICollectionViewFlowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //flow.estimatedItemSize = CGSize(width: 50, height: 50)
        
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.reuseid)
        collectionView.dataSource = self
        
        contentView.addSubview(label)
        contentView.addSubview(collectionView)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFittingSize(targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        self.collectionView.frame = CGRect(x: 0, y: 0, width: CGFloat(targetSize.width), height: CGFloat(MAXFLOAT))
        //setupConstraints()
        self.collectionView.layoutIfNeeded()
        
        var size = self.collectionView.collectionViewLayout.collectionViewContentSize()
        size = CGSize(width: size.width, height: size.height+50)
        
        return size
    }
    
    func setupConstraints() {
        let superView = contentView
        
        contentView.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        label.snp_makeConstraints { (make) in
            make.top.equalTo(superView).offset(10)
            make.centerX.equalTo(superView.snp_centerX)
            
        }
        
        collectionView.snp_makeConstraints { (make) in
            make.left.equalTo(superView).offset(10)
            make.top.equalTo(label.snp_bottom).offset(10)
            make.right.equalTo(superView).offset(-10)
            make.bottom.equalTo(superView).offset(-10)
            //make.height.equalTo(collectionView.intrinsicContentSize())
        }
    }
    
    func bindWithModel(){
        self.contentView.layoutIfNeeded()
    }
}
