//
//  NSAttributedStringExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Check Attributes

extension NSAttributedString {

    /// Check if the attribute is applied only on a specific text and not on the rest of the string
    /// - Parameters:
    ///   - attribute: `NSAttributedString.Key`, the attribute to check
    ///   - value: `Any`, the attribute's value expected. Currently supporting only Int
    ///   - appliedOn: `String`, the text that should have the attribute apply on
    /// - Returns: true if the attribute has been applied to the dedicated text, otherwise false.
    public func isAttributeActivated(_ attribute: NSAttributedString.Key,
                                     appliedOn text: String,
                                     value: Any) -> Bool {
        let applyInrange = NSRange(textToFind: text, in: string)
        for location in (0..<string.count) {
            if !checkAttributeState(attribute,
                                    value: value,
                                    applyInrange: applyInrange,
                                    location: location) {
                return false
            }
        }
        return true
    }

    private func checkAttributeState(_ attribute: NSAttributedString.Key,
                                     value: Any,
                                     applyInrange: NSRange,
                                     location: Int) -> Bool {
        let isActive = isAttributeActive(attribute, value: value, range: NSRange(location: location, length: 1))
        let isInRange = location >= applyInrange.location &&
                        location <= applyInrange.location + applyInrange.length
        return (!isInRange && !isActive) || (isInRange && isActive)
    }

    private func isAttributeActive(_ attribute: NSAttributedString.Key,
                                   value: Any,
                                   range: NSRange) -> Bool {
        var didFoundAttribute: Bool = false
        enumerateAttribute(attribute,
                           in: range,
                           options: .longestEffectiveRangeNotRequired) { value, rangeFound, _ in
            if (value as? Int) == 1 && !didFoundAttribute && rangeFound == range {
                didFoundAttribute = true
            }
        }
        return didFoundAttribute
    }

}
