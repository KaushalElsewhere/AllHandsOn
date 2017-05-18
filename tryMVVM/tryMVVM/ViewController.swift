//
//  ViewController.swift
//  tryMVVM
//
//  Created by Kaushal Elsewhere on 15/05/2017.
//  Copyright © 2017 Elsewhere. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! ProductCell
        let vm = ProductViewModel(product: products[indexPath.row])
        cell.setda
        return cell
    }
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
}

class ViewController: UIViewController {
    
    var products: [Product] = []
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        tableView.registerClass(ProductCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        return tableView
    }()

}

