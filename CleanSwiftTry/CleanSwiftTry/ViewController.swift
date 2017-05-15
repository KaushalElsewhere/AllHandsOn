//
//  ViewController.swift
//  CleanSwiftTry
//
//  Created by Kaushal Elsewhere on 10/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        configurePicker()
    }
    
    func configurePicker() {
        nameTextField.inputView = self.pickerView
    }
}

