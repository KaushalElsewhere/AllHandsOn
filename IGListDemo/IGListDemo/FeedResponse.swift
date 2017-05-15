//
//  FeedResponse.swift
//  IGListDemo
//
//  Created by Kaushal Elsewhere on 17/03/2017.
//  Copyright © 2017 Kaushal Elsewhere. All rights reserved.
//

import Foundation
import ObjectMapper

class FeedResponse: Mappable {
    var data: [FeedItem]?
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        data  <- map["data"]
    }
}
