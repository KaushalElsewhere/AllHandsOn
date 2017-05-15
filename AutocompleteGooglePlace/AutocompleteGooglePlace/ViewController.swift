//
//  ViewController.swift
//  AutocompleteGooglePlace
//
//  Created by Kaushal Elsewhere on 18/04/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    func setupViews() {
        
    }
    
    @IBAction func didClickSearchPlace(sender: AnyObject) {
        let controller = GMSAutocompleteViewController()
        controller.delegate = self
        //controller.modalTransitionStyle = .CoverVertical
        self.presentViewController(controller, animated: true, completion: nil)
    }
}

extension ViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(viewController: GMSAutocompleteViewController, didAutocompleteWithPlace place: GMSPlace) {
        print(place)
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func viewController(viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: NSError) {
        print(error)
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    func wasCancelled(viewController: GMSAutocompleteViewController) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
