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
extension ViewController: UITableViewDelegate, UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHieght, width: tableView.bounds.width, height: kTableHeaderHieght)
        if tableView.contentOffset.y < -kTableHeaderHieght {
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

//MARK:- Mark
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        slideShow.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width)
        
        tableView.tableHeaderView = slideShow
        tableView.delegate = self
        
        setupSlider()
        
        
        setupConstraint()
        
    }
    
    func setupSlider() {
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width)
        
        slideShow.frame = frame
        
        tableView.addSubview(slideShow)
        
        kTableHeaderHieght = self.view.bounds.width
        
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHieght, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHieght)
        //tableView.reloadData()
        updateHeaderView()
    }
    
    func setupConstraint() {
        let superView = view
        
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(superView)
        }
        
        
    }
}

class ViewController: UIViewController {

    var kTableHeaderHieght: CGFloat!
    
    let images = [
        "http://img.auctiva.com/imgdata/1/9/9/4/9/2/5/webimg/912245529_o.jpg",
        "http://img.auctiva.com/imgdata/1/9/9/4/9/2/5/webimg/912245493_o.jpg",
        "http://img.auctiva.com/imgdata/1/9/9/4/9/2/5/webimg/912245540_o.jpg",
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    lazy var slideShow: KASlideShow = {
        let slide: KASlideShow = KASlideShow()
        slide.transitionType = KASlideShowTransitionType.SlideHorizontal
        slide.imagesContentMode = .ScaleAspectFit
        slide.datasource = self
        slide.addGesture(.Swipe)
        return slide
    }()

}

