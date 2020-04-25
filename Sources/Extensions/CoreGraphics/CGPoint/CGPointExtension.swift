//
//  Created by Tom Baranes on 09/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import CoreGraphics

// MARK: - Operators

extension CGPoint {

    /// Create a new `CGPoint` by adding up two `CGPoint` together.
    /// - Parameters:
    ///   - lhs: One of the two `CGPoint` that will be added up.
    ///   - rhs: One of the two `CGPoint` that will be added up.
    /// - Returns: The `CGPoint` resulting of the two others addition.
    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    /// Create a new `CGPoint` by substracting two `CGPoint` together.
    /// - Parameters:
    ///   - lhs: One of the two `CGPoint` that will be substracted.
    ///   - rhs: One of the two `CGPoint` that will be substracted.
    /// - Returns: The `CGPoint` resulting of the two others substraction.
    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    /// Create a new `CGPoint` by multipliing a `CGPoint` with a scalar.
    /// - Parameters:
    ///   - point: The `CGPoint` that will be multiplied.
    ///   - scalar: The scalar that will be used to multiply the CGPoint.
    /// - Returns: The result of the multiplication between the CGPoint and the scalar.
    public static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
        CGPoint(x: point.x * scalar, y: point.y * scalar)
    }

}

// swiftlint:disable:next static_operator
public func += (lhs: inout CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

// swiftlint:disable:next static_operator
public func -= (lhs: inout CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

// swiftlint:disable:next static_operator
public func *= (point: inout CGPoint, scalar: CGFloat) {
    point = CGPoint(x: point.x * scalar, y: point.y * scalar)
}
