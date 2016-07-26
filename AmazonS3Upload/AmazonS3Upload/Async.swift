//
//  Async.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 26/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import Foundation

typealias Action = () -> ()

func run(onQueue queue: dispatch_queue_t = dispatch_get_main_queue(), block: Action) {
    dispatch_async(queue, block)
}