//
//  ViewController.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 26/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit

extension ViewController{

    func didChangeProgressValue(note: NSNotification){
        self.progressLabel.hidden = false
        self.progressView.hidden = false
        
        if let userInfo = note.userInfo,
        bytesWritten = userInfo[PostProgress.bytesWritten],
        totalExpectedBytes = userInfo[PostProgress.totalExpectedBytes] {

            let ratio:Double = Double(bytesWritten as! NSNumber) / Double(totalExpectedBytes as! NSNumber)
            let percent:Int = Int(ratio * 100)
            self.progressLabel.text = "\(percent)%"
            self.progressView.progress = Float(ratio)
        }
        
    }
    func didProgressFail(note:NSNotification){
        
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        selectedImage = image
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

extension ViewController {
    func didTapOnImageView() {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func didSelectUpload(sender: AnyObject) {
    
        guard let image = selectedImage else{
            return
        }
        
        
        
        ImageUploader.sharedInstance.uploadImage(image) { (succeed, URLString) in
            //TODO: goto somewhere after imaged posted
        }
    }

}
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
    }
    
    func setupViews() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapOnImageView))
        imageView.addGestureRecognizer(tap)
        
        imagePicker.delegate = self
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(didChangeProgressValue(_:)), name: kNotificationPostProgress, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(didProgressFail(_:)), name: kNotificationPostFailed, object: nil)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    lazy var imagePicker: UIImagePickerController = {
        let controller = UIImagePickerController()
        controller.sourceType = .PhotoLibrary
        return controller
    }()
    
    var selectedImage: UIImage?{
        didSet{
            imageView.image = selectedImage
        }
    }
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
}

