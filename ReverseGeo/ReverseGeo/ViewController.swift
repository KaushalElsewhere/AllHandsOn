//
//  ViewController.swift
//  ReverseGeo
//
//  Created by Kaushal Elsewhere on 7/11/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        search("Martin place")
    }


    
    func search(text: String) {
        CLGeocoder().geocodeAddressString(text, completionHandler:{ (placemarks, error) -> Void in
//            print(error)
//            print(placemarks)
            guard let nonNilMarks = placemarks else {return}
        
            for placemark in nonNilMarks {
                print("locality: \(placemark.locality!)")
                print("name: \(placemark.name!)")
                print("country: \(placemark.country!)")
                print("formatted address: \(placemark.addressDictionary!)")
            }
        })
    }


}

