//
//  ViewController.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 26/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit

extension ViewController: ImageUploaderDelegate {
    func imageUploaderDidChangeProgress(bytesWritten: Double, totalExpectedBytes: Double) {
        self.progressLabel.hidden = false
        self.progressView.hidden = false
        
        
        let ratio:Double = bytesWritten / totalExpectedBytes
        let percent:Int = Int(ratio * 100)
        self.progressLabel.text = "\(percent)%"
        self.progressView.progress = Float(ratio)
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
        
        
        imageUploader.uploadImage(image) { (succeed, URLString) in
            print(succeed)
            print(URLString)
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
    
    lazy var imageUploader: ImageUploader  = {
        let uploader = ImageUploader()
        uploader.delegate = self
        return uploader
    }()
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
}

