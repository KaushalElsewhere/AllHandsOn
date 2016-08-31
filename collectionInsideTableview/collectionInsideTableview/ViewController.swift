//
//  ViewController.swift
//  collectionInsideTableview
//
//  Created by Kaushal Elsewhere on 31/08/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import SnapKit

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 2:
            return createCollectionCell(tableView, forIndexPath: indexPath)
        default:
            return tableView.dequeueReusableCellWithIdentifier(UITableViewCell.reuseid)!
        }
    }
    
    private func createCollectionCell(tableView: UITableView, forIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CustomTableCell.reuseid) as! CustomTableCell
        //cell.updateConstraintsIfNeeded()
        return cell
    }
}

class ViewController: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        setupTableView()
        
        setupConstraints()
    }
    func setupConstraints() {
        
        let superView = view
        
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(superView)
        }
        
    }
    
    func setupTableView() {
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseid)
        tableView.registerClass(CustomTableCell.self, forCellReuseIdentifier: CustomTableCell.reuseid)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.estimatedRowHeight = 100
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.backgroundColor = UIColor.lightGrayColor()
        tableView.tableFooterView = UIView()
        
    }

}

