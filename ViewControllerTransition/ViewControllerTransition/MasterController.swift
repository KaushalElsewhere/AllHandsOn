//
//  ViewController.swift
//  ViewControllerTransition
//
//  Created by Kaushal Elsewhere on 2/09/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import UIKit
import SnapKit
import ZOZolaZoomTransition

extension MasterController : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return imageLiterals.count
        }
        
        return 1
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
            cell.imageView.image = UIImage(named: imageLiterals[indexPath.item])
            return cell
        }
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        cell.imageView.image = UIImage(named: imageLiterals[1])
        return cell
        
        //let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell

        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension MasterController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            let imageLitral =  imageLiterals[indexPath.item]
            let controller = DetailController(imageName: imageLitral)
            navigationController?.pushViewController(controller, animated: true)
            
            return
        }
        
        
        let imageLitral =  imageLiterals[1]
        let controller = DetailController(imageName: imageLitral)
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension MasterController: UICollectionViewDelegateFlowLayout {


    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let w = self.view.bounds.width/2 - 10
        //layout.itemSize = CGSize(width: w, height: w)
        //layout.minimumLineSpacing = 10
        //layout.minimumInteritemSpacing = 10
        
        
        if indexPath.section == 0 {
            return CGSize(width: w, height: w)
        }
        
        return CGSize(width: self.view.bounds.width-20, height: self.view.bounds.width/2)
    }
}

class MasterController: UIViewController {
    let imageLiterals = ["1", "2", "3", "4", "5", "1", "2", "3"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        let w = self.view.bounds.width/2 - 10
//        layout.itemSize = CGSize(width: w, height: w)
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
        
        let collectionView:UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerClass(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clearColor()
        collectionView.bounces = true
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.7, alpha: 1)
        view.addSubview(collectionView)
        
        navigationController?.delegate = self
        
        setupConstraint()
    }

    func setupConstraint() {
        let superView = view
        
        collectionView.snp_makeConstraints { (make) in
            make.edges.equalTo(superView)
        }
    }
}

class CustomCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6.0
        imageView.layer.masksToBounds = true
        imageView.contentMode = .ScaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        let superView = contentView
        
        imageView.snp_makeConstraints { (make) in
            make.edges.equalTo(superView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


/*

// MARK: -
// MARK: UITableView Delegate

extension LastEpisodesViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let mangaDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("mangaDetailsVC");
        self.navigationController?.pushViewController(mangaDetailsVC, animated: true);
        
    }
    
}

*/
// MARK: -
// MARK: UINavigationControllerDelegate
extension MasterController : UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let type = (fromVC == self) ? ZOTransitionType.Presenting : ZOTransitionType.Dismissing;
        
        //get selected cell
        let cell = self.collectionView.cellForItemAtIndexPath((self.collectionView.indexPathsForSelectedItems()?.last)!) as! CustomCell
        
        let zoomTransition = ZOZolaZoomTransition(fromView: cell.imageView, type: type, duration: 0.5, delegate: self)
        //zoomTransition.fadeColor = .blackColor() //.whiteColor()
        
        return zoomTransition;
    }
}

// MARK:- ZOZolaZoomTransitionDelegate
extension MasterController : ZOZolaZoomTransitionDelegate {
    func zolaZoomTransition(zoomTransition: ZOZolaZoomTransition!, startingFrameForView targetView: UIView!, relativeToView relativeView: UIView!, fromViewController: UIViewController!, toViewController: UIViewController!) -> CGRect {
        
        let cell = self.collectionView.cellForItemAtIndexPath((self.collectionView.indexPathsForSelectedItems()?.last)!) as! CustomCell
        //print(cell.imageView.image)
        
        if fromViewController == self {
            let rect = cell.imageView.convertRect(cell.imageView.bounds, toView: relativeView)
            //print(rect)
            return rect
            
        } else if fromViewController.isKindOfClass(DetailController){
            let  detailController = fromViewController as! DetailController
            
            return detailController.imageView.convertRect(detailController.imageView.bounds, toView: relativeView)
        }
        
        return CGRectZero
    }
    
    func zolaZoomTransition(zoomTransition: ZOZolaZoomTransition!, finishingFrameForView targetView: UIView!, relativeToView relativeView: UIView!, fromViewController fromViewComtroller: UIViewController!, toViewController: UIViewController!) -> CGRect {
        
        let cell = self.collectionView.cellForItemAtIndexPath((self.collectionView.indexPathsForSelectedItems()?.first)!) as! CustomCell
        
        if fromViewComtroller == self {
            let  detailController = toViewController as! DetailController
            let rect = detailController.imageView.convertRect(detailController.imageView.bounds, toView: relativeView)
            //print(rect)
            return rect
            
            
        } else if fromViewComtroller.isKindOfClass(DetailController) {
            return cell.imageView.convertRect(cell.imageView.bounds, toView: relativeView)
            
        }
        
        return CGRectZero
    }
}

