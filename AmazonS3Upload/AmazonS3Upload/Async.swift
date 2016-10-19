//
//  Async.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 26/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import Foundation

typealias Action = () -> ()

func run(onQueue queue: DispatchQueue = DispatchQueue.main, block: @escaping Action) {
    queue.async(execute: block)
}
