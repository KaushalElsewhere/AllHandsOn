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


typealias UploadActionn = (succeed: Bool, URLString: String) -> Void


protocol ImageUploaderDelegate: class {
    func imageUploaderDidChangeProgress(bytesWritten: Double, totalExpectedBytes: Double) -> Void
    
}

extension ImageUploader {
    func uploadImage(image: UIImage, handler: UploadActionn? = nil) {
        let data = UIImagePNGRepresentation(image)
       
        uploadData(data!, toSignedUrl: signedUrlString, handler: handler)
    }
}


class ImageUploader: NSObject {
    //static let sharedInstance = ImageUploader()
    
    weak var delegate: ImageUploaderDelegate?
    
    private func uploadData(data: NSData, toSignedUrl signedUrlString: URLStringConvertible, handler: UploadActionn? = nil){
        let fileURL = writeDataToFile(data)
        
        //Content-Type:image/png
        //Content-Type:image/png   headers: ["Content-Type":"image/png"]
        Alamofire.upload(.PUT, signedUrlString, headers: ["Content-Type":"image/png"], file: fileURL)
            .progress { bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
                //print(totalBytesWritten)
                let percent:Double = (Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)) * 100
                // This closure is NOT called on the main queue for performance
                // reasons. To update your ui, dispatch to the main queue.
                dispatch_async(dispatch_get_main_queue()) {
                    
                    //print("totalBytesWritten written on main queue: \(totalBytesWritten)")
                    //print("totalBytesExpectedToWrite bytes written on main queue: \(totalBytesExpectedToWrite)")
                    //print("\(percent)%")
                    
                   self.delegate?.imageUploaderDidChangeProgress(Double(totalBytesWritten), totalExpectedBytes: Double(totalBytesExpectedToWrite))
                    
                }
            }
            .validate()
            .responseData { (response) in
                if response.result.error != nil {
                    
                }
        }
        
        
        return
        
        
        /*
        //NOT REACHABLE CODE
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
 
         */
    }
    
    private func uploadData(data: NSData, toBucket: String, key: String, handler: UploadActionn? = nil){
        //TODO: bucket method is pending
    }
    
    private func uniqueString() -> String {
        return NSProcessInfo.processInfo().globallyUniqueString
    }
    
    private func writeDataToFile(data: NSData) -> NSURL{
        let filename = uniqueString()
        let filePath = (NSTemporaryDirectory() as NSString).stringByAppendingPathComponent(filename)
        let URL = NSURL(fileURLWithPath: filePath)
        
        data.writeToURL(URL, atomically: true)
        
        return URL
    }
}
