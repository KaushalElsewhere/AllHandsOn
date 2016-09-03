//
//  NextViewController.swift
//  SlideShowDemo
//
//  Created by Kaushal Elsewhere on 03/09/16.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import KIImagePager
import SDWebImage

extension NextViewController: KIImagePagerDataSource, KIImagePagerImageSource{
    func arrayWithImages(pager: KIImagePager!) -> [AnyObject]! {
        return images
    }
    
    func contentModeForImage(image: UInt, inPager pager: KIImagePager!) -> UIViewContentMode {
        return .ScaleAspectFill
    }
    
    func imageWithUrl(url: NSURL!, completion: KIImagePagerImageRequestBlock!) {
        
        let manager = SDWebImageManager.sharedManager()
        manager.downloadImageWithURL(url, options: .CacheMemoryOnly, progress: { (ob, on) in
            //
            }) { (image, error, cacheType, success, url) in
                completion(image, nil)
        }
    
    }
}

extension NextViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGrayColor()
        
        
        
        setupPagerwithtableView()
        
        setupconstraints()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        pager.pageControl.currentPage = 0
    }
    
    func setupPagerwithtableView() {
        pager.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width)
        kTableHeaderHieght = self.view.bounds.width
        
        tableView.addSubview(pager)
        
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHieght , left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHieght)
        
        view.addSubview(tableView)
        
        
        updateHeaderView()
    }
    
    func setupconstraints() {
        let superView = self.view
        
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(superView)
        }
    }
}
extension NextViewController: UITableViewDelegate, UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHieght, width: tableView.bounds.width, height: kTableHeaderHieght)
        if tableView.contentOffset.y < -kTableHeaderHieght {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        lastPageIndex = pager.currentPage
        
        pager.frame = headerRect
        tableView.layoutIfNeeded()
        
        pager.setCurrentPage(lastPageIndex, animated: false)
        print(lastPageIndex)
    }
    
}

class NextViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clearColor()
        tableView.delegate = self
        return tableView
    }()
    
    lazy var pager: KIImagePager = {
        let pager = KIImagePager()
        pager.contentMode = .ScaleAspectFill
        pager.dataSource = self
        pager.imageSource = self
        pager.backgroundColor = UIColor.blackColor()
        pager.currentPage = 0
        return pager
    }()
    
    var kTableHeaderHieght: CGFloat = 300
    
    var lastPageIndex: UInt = 0
}
