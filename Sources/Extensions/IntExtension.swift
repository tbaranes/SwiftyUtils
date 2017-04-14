//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Misc

extension Int {

    public var isEven: Bool { return (self % 2 == 0) }
    public var isOdd: Bool { return (self % 2 != 0) }
    public var isPositive: Bool { return (self > 0) }
    public var isNegative: Bool { return (self < 0) }
    public var range: Range<Int> { return 0..<self }

    public var digits: Int {
        if self == 0 {
            return 1
        } else if Int(fabs(Double(self))) <= LONG_MAX {
            return Int(log10(fabs(Double(self)))) + 1
        } else {
            return -1
        }
    }

}

// MARK: - Transform

extension Int {

    public var formattedPrice: String {
        let formatter = SUNumberFormatter.shared
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }

}

// MARK: - Round

extension Int {

    public var nearestDozens: Int { return nearest(to: 10) }
    public var nearestHundreds: Int { return nearest(to: 100) }
    public var nearestThousands: Int { return nearest(to: 1000) }

    public func nearest(to value: Int) -> Int {
        return self / value * value + (self % value) / (value / 2) * value
    }

}

// MARK: - Round below

extension Int {

    public var nearestBelowDozens: Int { return nearestBelow(to: 10) }
    public var nearestBelowHundreds: Int { return nearestBelow(to: 100) }
    public var nearestBelowThousands: Int { return nearestBelow(to: 1000) }

    public func nearestBelow(to value: Int) -> Int {
        return self / value * value + 0 / (value / 2) * value
    }

}

// MARK: - Round Up

extension Int {

    public var nearestUpDozens: Int { return nearestUp(to: 10) }
    public var nearestUpHundreds: Int { return nearestUp(to: 100) }
    public var nearestUpThousands: Int { return nearestUp(to: 1000) }

    public func nearestUp(to value: Int) -> Int {
        return self / value * value + (value / 2) / (value / 2) * value
    }

}
