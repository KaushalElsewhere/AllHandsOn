//
//  ViewController.swift
//  SlideShowDemo
//
//  Created by Kaushal Elsewhere on 2/09/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import SnapKit
import KASlideShow

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        return cell!
    }
}

extension ViewController: UITableViewDelegate, UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHieght, width: tableView.bounds.width, height: kTableHeaderHieght)
        if tableView.contentOffset.y < -(kTableHeaderHieght) {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        slideShow.frame = headerRect
    }
}

extension ViewController: KASlideShowDataSource {
    func slideShow(slideShow: KASlideShow!, objectAtIndex index: UInt) -> NSObject! {
        return NSURL(string: images[Int(index)])!
    }
    
    func slideShowImagesNumber(slideShow: KASlideShow!) -> UInt {
        return UInt(images.count)
    }
}

extension ViewController: KASlideShowDelegate {
    func slideShowWillShowNext(slideShow: KASlideShow!) {
        if Int(slideShow.currentIndex) == (images.count - 1){
            
        }
    }
}

//MARK:- Mark
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.addSubview(slideShow)
        view.addSubview(tableView)
        
        setupConstraint()
        
        kTableHeaderHieght = self.view.frame.size.width
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        setupSlider()
        
        self.tableView.layoutIfNeeded()
    }
    
    func setupSlider() {
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHieght , left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -(kTableHeaderHieght))
    
        updateHeaderView()
    }
    
    func setupConstraint() {
        let superView = view
        //tableView.frame = view.frame
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(superView).offset(49)
            make.left.equalTo(superView)
            make.right.equalTo(superView)
            make.bottom.equalTo(superView)
            
        }
    }
}

class ViewController: UIViewController {

    lazy var navHeight:CGFloat = {
        return self.navigationController?.navigationBar.bounds.height ?? 0.0
    }()
    
    var kTableHeaderHieght: CGFloat = 300
    
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    lazy var slideShow: KASlideShow = {
        
        let slide: KASlideShow = KASlideShow(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width))
        slide.transitionType = KASlideShowTransitionType.SlideHorizontal
        slide.imagesContentMode = .ScaleAspectFill
        slide.datasource = self
        slide.addGesture(.Swipe)
        return slide
    }()

}

public let images = [
    "http://img.auctiva.com/imgdata/1/9/9/4/9/2/5/webimg/912245529_o.jpg",
    "http://img.auctiva.com/imgdata/1/9/9/4/9/2/5/webimg/912245493_o.jpg",
    "http://img.auctiva.com/imgdata/1/9/9/4/9/2/5/webimg/912245540_o.jpg",
]

