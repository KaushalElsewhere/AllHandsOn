//
//  UITableViewCell+Reuseidentifier.swift
//  TotsAmour
//
//  Created by Kaushal Elsewhere on 29/08/2016.
//  Copyright © 2016 birdcageapp. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var reuseid: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseid: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ReusableView {
    
}
