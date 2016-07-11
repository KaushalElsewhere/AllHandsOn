//
//  ViewController.swift
//  KeyboardObserverTry
//
//  Created by Kaushal Elsewhere on 11/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
extension ViewController: UITextFieldDelegate{
    
}
extension ViewController{
    private func setupNotificationObservers() {
        keyboardWillShowObserver = NotificationObserver(notification: Keyboard.Notifications.KeyboardWillShow, block: keyboardWillChangeFrame)
        keyboardWillHideObserver = NotificationObserver(notification: Keyboard.Notifications.KeyboardWillHide, block: keyboardWillChangeFrame)
    }
    
    private func removeNotificationObservers() {
        keyboardWillShowObserver?.removeObserver()
        keyboardWillShowObserver = nil
        
        keyboardWillHideObserver?.removeObserver()
        keyboardWillHideObserver = nil
    }
    
    private func keyboardWillChangeFrame(keyboard: Keyboard) {
        print(keyboard)
//        let bottomInset = keyboard.keyboardBottomInset(inView: scrollView)
//        scrollView.contentInset.bottom = bottomInset
//        scrollView.scrollIndicatorInsets.bottom = bottomInset
//        scrollView.contentOffset = CGPoint(x: 0, y: keyboard.active ? keyboard.bottomInset - 100 : 0)
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        
        if indexPath.row == 0{
            username.frame = CGRect(x: 80, y: 10, width: 200, height: 20)
            cell.contentView.addSubview(username)
        } else{
            password.frame = CGRect(x: 80, y: 10, width: 200, height: 20)
            cell.contentView.addSubview(password)
        }
        
        
        return cell
    }
}
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var username: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .lightGrayColor()
        textfield.textAlignment = .Center
        textfield.textColor = .whiteColor()
        return textfield
    }()
    
    lazy var password: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .lightGrayColor()
        textfield.textAlignment = .Center
        textfield.textColor = .whiteColor()
        return textfield
    }()
    
    var keyboardWillShowObserver: NotificationObserver?
    var keyboardWillHideObserver: NotificationObserver?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.delegate = self
        password.delegate = self
        
        tableView.backgroundColor = .lightGrayColor()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let headerView = UIView(frame:CGRect(x: 0, y: 0, width: 10, height: 390))
        headerView.backgroundColor = .whiteColor()
        tableView.tableHeaderView = headerView
        let footerView = UIView(frame:CGRect(x: 0, y: 0, width: 10, height: 200))
        footerView.backgroundColor = .whiteColor()
        tableView.tableFooterView = footerView
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:))))
        
        view.setNeedsDisplay()
        
        self.setupNotificationObservers()
        
    }
//    override func viewDidDisappear(animated: Bool) {
//        super.viewDidDisappear(animated)
//        removeNotificationObservers()
//    }

}

