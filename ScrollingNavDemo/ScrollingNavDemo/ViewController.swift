//
//  ViewController.swift
//  ScrollingNavDemo
//
//  Created by Kaushal Elsewhere on 21/10/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        //collectionView.collectionViewLayout.size = CGSize(width: 150, height: 150)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let navigationController = self.navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(collectionView, delay: 50.0)
        }
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.whiteColor()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let controller = DetailViewController()
        navigationController?.pushViewController(controller, animated: true)
    }

}

