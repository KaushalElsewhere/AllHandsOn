//
//  ViewController.swift
//  TryMadhu
//
//  Created by Kaushal Elsewhere on 15/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit
import SnapKit

protocol FirstControllerDelegate: class  {
    func firstControllerDidSelectNext()
}

extension FirstController {
    func gotoNextScene() {
        delegate?.firstControllerDidSelectNext()
    }
    
    func didTapSwitch(sender: UISwitch) {
        if sender.on == true {
            settings = backupSetting
            tableView.reloadData()
        } else {
            settings = []
            tableView.reloadData()
        }
    }
}

extension FirstController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                //do nothing
            } else {
                gotoNextScene()
            }
            
        } else {
            //do notthing
        }

    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        switch indexPath.row {
//        case 0:
//            return 40.0
//        case 1:
//            return 40.0
//        case 2:
//            return 40.0
//        case 3:
//            return 40.0
//        default:
//            return 40.0
//        }
//        
//    }
}

extension FirstController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return products.count
        } else {
            return settings.count
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return configureProductCell(tableView, forindexPath: indexPath)
        } else {
            return configureSettingsCell(tableView, forindexPath: indexPath)
        }
    }
    
    func configureProductCell(tableView: UITableView, forindexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell") as! ProductCell
        
        
        //configure
        if indexPath.row == 1 {
            cell.accessoryView = googleswitch
            cell.selectionStyle = .None
        } else {
            cell.accessoryType = .DisclosureIndicator
        }
        
        
        
        //data
        let item = products[indexPath.row]
        cell.textLabel!.text = item.name
        
        
        return cell
    }
    
    func configureSettingsCell(tableView: UITableView, forindexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SettingsCell") as! SettingsCell
        
        
//        //configure
//        if indexPath.row == 1 {
//            cell.accessoryView = UISwitch()
//        } else {
//            cell.accessoryType = .DisclosureIndicator
//        }
        
        
        
        //data
        let item = settings[indexPath.row]
        cell.usernameTextFild.placeholder = item.name
        
        
        return cell
    }
}

//Setups
extension FirstController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        configureUI()
        //readAPI
        //updateUI
        //Register Actions
    
    }
    func configureUI() {
        tableView.registerClass(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.registerClass(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        
        view.addSubview(tableView)
    }
    
}

class FirstController: UIViewController {
    weak var delegate: FirstControllerDelegate?
    
    var products: [Product] = [
        Product(name: "Apple"),
        Product(name: "Google"),
        Product(name: "Yahoo"),
    ]
    
    var settings: [Setting] = [
        Setting(name: "General"),
        Setting(name: "Notification"),
        Setting(name: "Display"),
        Setting(name: "Wifi")
    ]
    
    var backupSetting: [Setting] = [
        Setting(name: "General"),
        Setting(name: "Notification"),
        Setting(name: "Display"),
        Setting(name: "Wifi")
    ]
    
    lazy var googleswitch: UISwitch  = {
        let sw = UISwitch()
        sw.setOn(true, animated: false)
        sw.addTarget(self, action: #selector(didTapSwitch), forControlEvents: .ValueChanged)
        return sw
    }()
    
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), style: .Grouped)
        tableView.backgroundColor = .lightGrayColor()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    
}


//passing data
//1. call function //manual
//2. delegates
//3. closures
//4. NSNotification/ Observer
//5. Key Value Observing





