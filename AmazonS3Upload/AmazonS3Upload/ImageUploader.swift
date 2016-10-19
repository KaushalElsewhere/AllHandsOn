//
//  ImageUploader.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 17/08/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//
import UIKit
import Alamofire

let signedUrlString = "https://totsamour-upload-test.s3-ap-southeast-2.amazonaws.com/kaushal_test.png?Content-Type=image%2Fpng&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIDWRCH3X6CPHSJ7Q%2F20160817%2Fap-southeast-2%2Fs3%2Faws4_request&X-Amz-Date=20160817T024602Z&X-Amz-Expires=604800&X-Amz-Signature=f4bfefd6c3097fc193b089e50c15a7f3693b45504e89453ec5be1860ec5528a8&X-Amz-SignedHeaders=host"


public struct PostProgress{
    public static let bytesWritten = "bytesWritten"
    public static let totalExpectedBytes =  "totalExpectedBytes"
}

typealias UploadActionn = (_ succeed: Bool, _ URLString: String) -> Void

extension ImageUploader {
    func uploadImage(_ image: UIImage, handler: UploadActionn? = nil) {
        let data = UIImagePNGRepresentation(image)
       
        uploadData(data!, toSignedUrl: signedUrlString, handler: handler)
    }
}
public let kNotificationPostProgress = "NotificationPostProgress"
public let kNotificationPostFailed = "NotificationPostFailed"

class ImageUploader: NSObject {
    static let sharedInstance = ImageUploader()

    fileprivate func uploadData(_ data: Data, toSignedUrl signedUrlString: URLStringConvertible, handler: UploadActionn? = nil){
        let fileURL = writeDataToFile(data)
        
        Alamofire.upload(.PUT, signedUrlString, headers: ["Content-Type":"image/png"], file: fileURL)
            .progress { bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
                print("")
                dispatch_async(dispatch_get_main_queue()) {
    
                    let obj = [
                        PostProgress.bytesWritten: Double(totalBytesWritten),
                        PostProgress.totalExpectedBytes: Double(totalBytesExpectedToWrite)
                    ]
                    NSNotificationCenter.defaultCenter().postNotificationName(kNotificationPostProgress, object: self, userInfo: obj)
                    
                }
            }
            .validate()
            .responseData { (response) in
                if response.result.error != nil {
                    NSNotificationCenter.defaultCenter().postNotificationName(kNotificationPostFailed, object: self, userInfo: nil)
                }
        }
    }
    
    fileprivate func uniqueString() -> String {
        return ProcessInfo.processInfo.globallyUniqueString
    }
    
    fileprivate func writeDataToFile(_ data: Data) -> URL{
        let filename = uniqueString()
        let filePath = (NSTemporaryDirectory() as NSString).appendingPathComponent(filename)
        let URL = Foundation.URL(fileURLWithPath: filePath)
        
        try? data.write(to: URL, options: [.atomic])
        
        return URL
    }
}
