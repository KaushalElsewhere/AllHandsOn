//
//  Manager.swift
//  TryMadhu
//
//  Created by Kaushal Elsewhere on 16/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import Foundation

protocol NetworkManagerDelegate: class {
    func networkManagerDidRecieveData(items: [Product]) -> Void
}

class NetworkManager {
    weak var delegate: NetworkManagerDelegate?
    
    init() {
        //
    }
    
    func getItems() {
        // api calls
        //recieved data then send it to Detail controller
        delegate?.networkManagerDidRecieveData([])
    }
}