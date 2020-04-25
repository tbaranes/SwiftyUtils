//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Misc

extension Int {

    public var isEven: Bool { self.isMultiple(of: 2) }
    public var isOdd: Bool { !isEven }
    public var isPositive: Bool { self > 0 }
    public var isNegative: Bool { !isPositive }
    public var range: Range<Int> { 0..<self }

    public var digits: Int {
        if self == 0 {
            return 1
        }
        return Int(log10(fabs(Double(self)))) + 1
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

    public var nearestDozens: Int { nearest(to: 10) }
    public var nearestHundreds: Int { nearest(to: 100) }
    public var nearestThousands: Int { nearest(to: 1000) }

    public func nearest(to value: Int) -> Int {
        self / value * value + (self % value) / (value / 2) * value
    }

}

// MARK: - Round below

extension Int {

    public var nearestBelowDozens: Int { nearestBelow(to: 10) }
    public var nearestBelowHundreds: Int { nearestBelow(to: 100) }
    public var nearestBelowThousands: Int { nearestBelow(to: 1000) }

    public func nearestBelow(to value: Int) -> Int {
        self / value * value + 0 / (value / 2) * value
    }

}

// MARK: - Round Up

extension Int {

    public var nearestUpDozens: Int { nearestUp(to: 10) }
    public var nearestUpHundreds: Int { nearestUp(to: 100) }
    public var nearestUpThousands: Int { nearestUp(to: 1000) }

    public func nearestUp(to value: Int) -> Int {
        self / value * value + (value / 2) / (value / 2) * value
    }

}
