//
//  NSLayoutConstraintsExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public extension NSLayoutConstraint {
    
    public func applyMultiplier(multiplier: CGFloat, toView: UIView) {
        switch firstAttribute {
        case .Width:
            constant = toView.bounds.width * multiplier
        case .Height:
            constant = toView.bounds.height * multiplier
        default:
            break
        }
    }
    
}