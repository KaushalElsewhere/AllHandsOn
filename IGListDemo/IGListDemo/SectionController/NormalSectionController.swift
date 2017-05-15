//
//  NormalSectionController.swift
//  IGListDemo
//
//  Created by Kaushal Elsewhere on 2/05/2017.
//  Copyright © 2017 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import IGListKit

class NormalSectionController: IGListSectionController {
    //var entry: FeedItem!
    var feed: [FeedItem] = []
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
    }
}

extension NormalSectionController: IGListSectionType {
    func numberOfItems() -> Int {
        return feed.count
    }
    
    func sizeForItemAtIndex(index: Int) -> CGSize {
        
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width/2 - 10
        
        return CGSize(width: width, height: 100)
    }
    
    func cellForItemAtIndex(index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCellOfClass(FeedCell.self, forSectionController: self, atIndex: index) as! FeedCell
        cell.label.text = feed[index].id
        cell.label.sizeToFit()
        return cell
    }
    
    func didUpdateToObject(object: AnyObject) {
        if let node = object as? FeedStruct {
            feed = node.items
        }
    }
    
    func didSelectItemAtIndex(index: Int) {
        //
    }
}
