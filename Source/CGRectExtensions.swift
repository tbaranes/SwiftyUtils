//
//  CGRectExtensions.swift
//  SwiftyUtils
//
//  Created by Mulang Su on 11/01/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import CoreGraphics

public extension CGRect {
    public var x: CGFloat {
        return origin.x
    }
    
    public var y: CGFloat {
        return origin.y
    }
    
    public func with(x: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    public func with(y: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    public func with(width: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    public func with(height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    public func with(origin: CGPoint) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    public func with(size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
}
