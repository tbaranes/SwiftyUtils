//
//  Created by Tom Baranes on 09/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import CoreGraphics

// MARK: - Operators

extension CGSize {

    public static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }

    public static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }

    public static func * (size: CGSize, scalar: CGFloat) -> CGSize {
        return CGSize(width: size.width * scalar, height: size.height * scalar)
    }

}

// swiftlint:disable:next static_operator
public func += (lhs: inout CGSize, rhs: CGSize) {
    lhs = CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

// swiftlint:disable:next static_operator
public func -= (lhs: inout CGSize, rhs: CGSize) {
    lhs = CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
}

// swiftlint:disable:next static_operator
public func *= (size: inout CGSize, scalar: CGFloat) {
    size = CGSize(width: size.width * scalar, height: size.height * scalar)
}
