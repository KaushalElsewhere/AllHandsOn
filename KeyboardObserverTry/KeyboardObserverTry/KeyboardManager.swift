//
//  KeyboardManager.swift
//  KeyboardObserverTry
//
//  Created by Kaushal Elsewhere on 12/07/2016.
//  Copyright © 2016 Kaushal Elsewhere. All rights reserved.
//

import Foundation
import UIKit

struct KeyboardManager{
    var active = false
    var external = false
    var bottomInset: CGFloat = 0.0
    var endFrame = CGRectZero
    var curve = UIViewAnimationCurve.Linear
    var options = UIViewAnimationOptions.CurveLinear
    var duration: Double = 0.0
    
    init(notification: NSNotification) {
        if let durationValue = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber {
            duration = durationValue.doubleValue
        }
        else {
            duration = 0
        }
        if let rawCurveValue = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber) {
            let rawCurve = rawCurveValue.integerValue
            curve = UIViewAnimationCurve(rawValue: rawCurve) ?? .EaseOut
            let curveInt = UInt(rawCurve << 16)
            options = UIViewAnimationOptions(rawValue: curveInt)
        }
        else {
            curve = .EaseOut
            options = .CurveEaseOut
        }
        
        endFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
    }
}