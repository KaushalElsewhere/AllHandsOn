//
//  ViewController.swift
//  AmazonS3Upload
//
//  Created by Kaushal Elsewhere on 26/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
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
        
        
        S3Uploader.uploadImage(image) { (succeed, URLString) in
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
}

