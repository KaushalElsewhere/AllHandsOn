//
//  Helper.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 26/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import Foundation
import AWSS3

typealias UploadAction = (succeed: Bool, URLString: String) -> Void

extension S3Uploader {
    static func uploadImage(image: UIImage, handler: UploadAction? = nil) {
        let data = UIImagePNGRepresentation(image)
        //let filename = (uniqueString() as NSString).stringByAppendingPathExtension("png")!
        
        let signedUrl = NSURL(string: "https://totsamour-upload-test.s3.amazonaws.com/?Signature=o2du%2ByD%2FcvXmBJJ5gQd9ghU%2Baj0%3D&Expires=1470111962&AWSAccessKeyId=AKIAIDWRCH3X6CPHSJ7Q")!
        
        uploadData(data!, toSignedUrl: signedUrl, handler: handler)
    }
}


struct S3Uploader {
    static func uploadData(data: NSData, toSignedUrl signedUrl: NSURL, handler: UploadAction? = nil){
        let fileURL = writeDataToFile(data)
        
        
    
        let request = NSMutableURLRequest(URL: signedUrl)
        request.cachePolicy = .ReloadIgnoringLocalCacheData
        request.HTTPMethod = "PUT"
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        
        let session = NSURLSession.sharedSession()
        let uploadTask: NSURLSessionUploadTask = session.uploadTaskWithRequest(request, fromFile: fileURL) { (data, response, error) in
            if error != nil {
                handler?(succeed: false, URLString: "nothing")
                
                return
            }
            
            print(response)
        }
        uploadTask.resume()
        
        
        //NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:signedUrl];
        //request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        //[request setHTTPMethod:@"PUT"];
        //[request setValue:fileContentTypeStr forHTTPHeaderField:@"Content-Type"];
        
        //self.uploadTask = [self.session uploadTaskWithRequest:request fromFile:self.uploadFileURL];
        //uploadTask is an instance of NSURLSessionDownloadTask.
        //session is an instance of NSURLSession.
        //[self.uploadTask resume];
        
        
        
//        NSURL *URL = [NSURL URLWithString:@"http://example.com/upload"];
//        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//        NSData *data = ...;
//        
//        NSURLSession *session = [NSURLSession sharedSession];
//        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
//        fromData:data
//        completionHandler:
//        ^(NSData *data, NSURLResponse *response, NSError *error) {
//        // ...
//        }];
//        
//        [uploadTask resume];
    }
    
    static func uploadData(data: NSData, toBucket: String, key: String, handler: UploadAction? = nil){
        //TODO: bucket method is pending
    }
    
    private static func uniqueString() -> String {
        return NSProcessInfo.processInfo().globallyUniqueString
    }
    
    private static func writeDataToFile(data: NSData) -> NSURL{
        let filename = uniqueString()
        let filePath = (NSTemporaryDirectory() as NSString).stringByAppendingPathComponent(filename)
        let URL = NSURL(fileURLWithPath: filePath)
        
        data.writeToURL(URL, atomically: true)
        
        return URL
    }
}
