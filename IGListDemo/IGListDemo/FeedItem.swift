//
//  FeedItem.swift
//  IGListDemo
//
//  Created by Kaushal Elsewhere on 17/03/2017.
//  Copyright © 2017 Kaushal Elsewhere. All rights reserved.
//

import Foundation
import ObjectMapper
import IGListKit

final class FeedItem: Mappable {
    var id: String?
    var title: String?
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id      <- map["id"]
        title   <- map["title"]
    }
}

extension FeedItem: IGListDiffable {
    @objc func diffIdentifier() -> NSObjectProtocol {
        return id as! NSObjectProtocol
    }
    
    @objc func isEqualToDiffableObject(object: IGListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object =  object as? FeedItem else { return false }
        return id == object.id
    }
}