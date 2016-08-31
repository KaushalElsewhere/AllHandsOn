//
//  UICollectionViewCell+Reuseidentifier.swift
//  TotsAmour
//
//  Created by Kaushal Elsewhere on 31/08/2016.
//  Copyright © 2016 birdcageapp. All rights reserved.
//

import Foundation
import UIKit

//commented because already declared
//protocol ReusableView: class {
//    static var reuseid: String { get }
//}

//extension ReusableView where Self: UIView {
//    static var reuseid: String {
//        return NSStringFromClass(self)
//    }
//}

extension UICollectionViewCell: ReusableView {
    
}