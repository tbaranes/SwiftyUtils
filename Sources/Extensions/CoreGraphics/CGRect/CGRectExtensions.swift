//
//  Created by Mulang Su on 11/01/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import CoreGraphics

// MARK: - Getter

extension CGRect {

    /// Returns the `x` value of the CGRect.
    public var x: CGFloat {
        origin.x
    }

    /// Returns the `y` value of the CGRect.
    public var y: CGFloat {
        origin.y
    }

}

// MARK: - Transform

extension CGRect {

    /// Replace the current CGRect's `x` value with a new one.
    /// - Parameter x: The new `x` value.
    /// - Returns: The `CGRect` containing the new `x` value.
    public func with(x: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    /// Replace the current CGRect's `y` value with a new one.
    /// - Parameter y: The new `y` value.
    /// - Returns: The `CGRect` containing the new `y` value.
    public func with(y: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    /// Replace the current CGRect's `width` value with a new one.
    /// - Parameter width: The new `width` value.
    /// - Returns: The `CGRect` containing the new `width` value.
    public func with(width: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    /// Replace the current CGRect's `height` value with a new one.
    /// - Parameter height: The new `height` value.
    /// - Returns: The `CGRect` containing the new `height` value.
    public func with(height: CGFloat) -> CGRect {
        CGRect(x: x, y: y, width: width, height: height)
    }

    /// Replace the current CGRect's `origin` value with a new one.
    /// - Parameter origin: The new `origin` value.
    /// - Returns: The `CGRect` containing the new `origin` value.
    public func with(origin: CGPoint) -> CGRect {
        CGRect(origin: origin, size: size)
    }

    /// Replace the current CGRect's `size` value with a new one.
    /// - Parameter size: The new `size` value.
    /// - Returns: The `CGRect` containing the new `size` value.
    public func with(size: CGSize) -> CGRect {
        CGRect(origin: origin, size: size)
    }

}
