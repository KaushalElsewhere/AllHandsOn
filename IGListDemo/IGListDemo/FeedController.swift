//
//  ViewController.swift
//  IGListDemo
//
//  Created by Kaushal Elsewhere on 20/01/2017.
//  Copyright © 2017 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import IGListKit

extension FeedController: IGListAdapterDataSource {
    func objectsForListAdapter(listAdapter: IGListAdapter) -> [IGListDiffable] {
        return all as [IGListDiffable]
    }
    
    func listAdapter(listAdapter: IGListAdapter, sectionControllerForObject object: AnyObject) -> IGListSectionController {
        return NormalSectionController()
    }
    
    func emptyViewForListAdapter(listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}

extension FeedController {
    func readData() {
        if let data = DataLoader.readFeedItems() {
            let sect = FeedStruct(id: "100", items: data)
            all = [sect]
            adapter.performUpdatesAnimated(true, completion: nil)
        }
    }
    
    func didRefresh() {
        if let data = DataLoader.readAnychanges() {
            let sect = all.first ?? FeedStruct(id: "100", items: [])
            sect.items += data
            all = [sect]
            adapter.performUpdatesAnimated(true, completion: nil)
        }
    }
    
    func loadItem() {
        readData()
    }
}

extension FeedController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .whiteColor()
        view.addSubview(collectionView)
        setupNav()
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        //readData()
    }
    
    func setupNav() {
        let refreshBBI = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(didRefresh))
        let addBBI = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(loadItem))
        navigationItem.setRightBarButtonItems([refreshBBI, addBBI], animated: true)
    }
}

class FeedController: UIViewController {
    var all: [FeedStruct] = []
    //var pathFinder = PathFinder()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: self.view.bounds.width/2-10, height: 100)
//        layout.minimumInteritemSpacing = 10
//        layout.minimumLineSpacing = 10
//        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

        return layout
    }()
    
    lazy var collectionView: IGListCollectionView = {
        let collection: IGListCollectionView =  IGListCollectionView(frame: self.view.bounds, collectionViewLayout: self.layout)
        collection.registerClass(FeedCell.self, forCellWithReuseIdentifier: "FeedCell")
        collection.backgroundColor = .grayColor()
        //collection.dataSource = self
        collection.alwaysBounceVertical = true
        return collection
    }()
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
}

class PathFinder {
    
}
