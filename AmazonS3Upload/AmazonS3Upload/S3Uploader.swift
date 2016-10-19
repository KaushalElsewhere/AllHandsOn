//
//  Helper.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 26/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import Foundation
import AWSS3

typealias UploadAction = (_ succeed: Bool, _ URLString: String) -> Void

extension S3Uploader {
    static func uploadImage(_ image: UIImage, handler: UploadAction? = nil) {
        let data = UIImagePNGRepresentation(image)
        //let filename = (uniqueString() as NSString).stringByAppendingPathExtension("png")!
        
        let signedUrl = URL(string: "https://totsamour-upload-test.s3.amazonaws.com/?Signature=o2du%2ByD%2FcvXmBJJ5gQd9ghU%2Baj0%3D&Expires=1470111962&AWSAccessKeyId=AKIAIDWRCH3X6CPHSJ7Q")!
        
        uploadData(data!, toSignedUrl: signedUrl, handler: handler)
    }
}


struct S3Uploader {
    static func uploadData(_ data: Data, toSignedUrl signedUrl: URL, handler: UploadAction? = nil){
        let fileURL = writeDataToFile(data)
        
        
    
        let request = NSMutableURLRequest(url: signedUrl)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.httpMethod = "PUT"
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let uploadTask: URLSessionUploadTask = session.uploadTask(with: request as URLRequest, fromFile: fileURL, completionHandler: { (data, response, error) in
            if error != nil {
                handler?(false, "nothing")
                
                return
            }
            
            print(response)
        }) 
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
    
    static func uploadData(_ data: Data, toBucket: String, key: String, handler: UploadAction? = nil){
        //TODO: bucket method is pending
    }
    
    fileprivate static func uniqueString() -> String {
        return ProcessInfo.processInfo.globallyUniqueString
    }
    
    fileprivate static func writeDataToFile(_ data: Data) -> URL{
        let filename = uniqueString()
        let filePath = (NSTemporaryDirectory() as NSString).appendingPathComponent(filename)
        let URL = Foundation.URL(fileURLWithPath: filePath)
        
        try? data.write(to: URL, options: [.atomic])
        
        return URL
    }
}
