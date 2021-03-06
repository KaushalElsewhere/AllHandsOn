//
//  CreateOrderViewController.swift
//  CleanSwiftTry
//
//  Created by Kaushal Elsewhere on 10/05/2017.
//  Copyright (c) 2017 Elsewhere. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CreateOrderViewControllerInput {
    func displayPrice(_ viewModel: CreateOrder_Price_ViewModel)
    func displaySomething(_ viewModel: CreateOrder.Something.ViewModel)
}

protocol CreateOrderViewControllerOutput {
    var shippingMethods: [String] { get }
    
    func calculatePrice(_ request: CreateOrder_Price_Request)
    
    func doSomething(_ request: CreateOrder.Something.Request)
    
    func getPaymentOptions()
}

class CreateOrderViewController: UITableViewController, CreateOrderViewControllerInput {
    var output: CreateOrderViewControllerOutput!
    var router: CreateOrderRouter!
  
    @IBOutlet weak var shippingTextField: UITextField!
    
    @IBOutlet var pickerView: UIPickerView!
    
    override func awakeFromNib() {
        CreateOrderConfigurator.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomethingOnLoad()
    }
    
    func configurePicker() {
        shippingTextField.inputView = self.pickerView
        shippingTextField.becomeFirstResponder()
    }
  
    func doSomethingOnLoad() {
        configurePicker()
        setDefaultValue()
        
    // NOTE: Ask the Interactor to do some work
        //let request = CreateOrder.Something.Request()
        //output.doSomething(request)
    }
    
    func setDefaultValue() {
        pickerView.selectRow(0, inComponent: 0, animated: false)
        let request = CreateOrder_Price_Request(selectedIndex: 0)
        output.calculatePrice(request)
    }
  
    // MARK: - Display logic
  
    func displaySomething(_ viewModel: CreateOrder.Something.ViewModel) {
    // NOTE: Display the result from the Presenter
    
    // nameTextField.text = viewModel.name
    }
    
    func displayPrice(_ viewModel: CreateOrder_Price_ViewModel) {
        shippingTextField.text = viewModel.price
    }
}
extension CreateOrderViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return output.shippingMethods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return output.shippingMethods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let request = CreateOrder_Price_Request(selectedIndex: row)
        output.calculatePrice(request)
    }
}
