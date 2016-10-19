//
//  ViewController.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 26/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit

extension ViewController{

    func didChangeProgressValue(_ note: Notification){
        self.progressLabel.isHidden = false
        self.progressView.isHidden = false
        
        if let userInfo = (note as NSNotification).userInfo,
        let bytesWritten = userInfo[PostProgress.bytesWritten],
        let totalExpectedBytes = userInfo[PostProgress.totalExpectedBytes] {

            let ratio:Double = Double(bytesWritten as! NSNumber) / Double(totalExpectedBytes as! NSNumber)
            let percent:Int = Int(ratio * 100)
            self.progressLabel.text = "\(percent)%"
            self.progressView.progress = Float(ratio)
        }
        
    }
    func didProgressFail(_ note:Notification){
        
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        selectedImage = image
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ViewController {
    func didTapOnImageView() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func didSelectUpload(_ sender: AnyObject) {
    
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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeProgressValue(_:)), name: NSNotification.Name(rawValue: kNotificationPostProgress), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didProgressFail(_:)), name: NSNotification.Name(rawValue: kNotificationPostFailed), object: nil)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    lazy var imagePicker: UIImagePickerController = {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
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

