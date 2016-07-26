//
//  S3.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 26/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import Foundation
import AWSS3

extension S3 {
    static let defaultS3 = S3(
        regionType: .APNortheast1,
        identityPoolId: "any",
        bucket: "totsamour-upload-test"

    )
}

struct S3 {
    let regionType: AWSRegionType
    let identityPoolId: String
    let bucket: String
}