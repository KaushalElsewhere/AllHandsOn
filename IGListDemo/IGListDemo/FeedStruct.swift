//
//  FeedStruct.swift
//  IGListDemo
//
//  Created by Kaushal Elsewhere on 2/05/2017.
//  Copyright © 2017 Kaushal Elsewhere. All rights reserved.
//

import Foundation
import IGListKit

class FeedStruct: IGListDiffable {
    var id: String
    var items: [FeedItem]

    init(id: String, items: [FeedItem]) {
        self.id = id
        self.items = items
    }
    
    @objc func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    @objc func isEqualToDiffableObject(object: IGListDiffable?) -> Bool {
        return true
    }
}
