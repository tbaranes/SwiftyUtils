//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation
#if os(iOS) || os (tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

public extension NSMutableAttributedString {

    // MARK - Colors

    public static func setTextColor(text: String, color: SwiftyColor, afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.setTextColor(color: color, afterOcurrence: occurence)
        return attrStr
    }

    public static func setTextColor(text: String, color: SwiftyColor, forOccurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.setTextColor(color: color, forOccurences: searchString)
        return attrStr
    }

    public func setTextColor(color: SwiftyColor, afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            setTextColor(value: color, range: range)
        }
    }

    public func setTextColor(color: SwiftyColor, forOccurences searchString: String) {
        addAttributeForOccurence(searchString: searchString, value: color, funcAddingAttribute: setTextColor)
    }

    // MARK - Strike

    public static func setTextStrike(text: String, afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.setTextStrike(afterOcurrence: occurence)
        return attrStr
    }

    public static func setTextStrike(text: String, forOccurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.setTextStrike(forOccurences: searchString)
        return attrStr
    }

    public func setTextStrike(afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            setTextStrike(range: range)
        }
    }

    public func setTextStrike(forOccurences searchString: String) {
        addAttributeForOccurence(searchString: searchString, funcAddingAttribute: setTextStrike)
    }

    // MARK - Strike

    public static func setTextUnderline(text: String, afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.setTextUnderline(afterOcurrence: occurence)
        return attrStr
    }

    public static func setTextUnderline(text: String, forOccurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.setTextUnderline(forOccurences: searchString)
        return attrStr
    }

    public func setTextUnderline(afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            setTextUnderline(range: range)
        }
    }

    public func setTextUnderline(forOccurences searchString: String) {
        addAttributeForOccurence(searchString: searchString, funcAddingAttribute: setTextUnderline)
    }

    // MARK - Private

    private func addAttributeForOccurence(searchString: String, value: AnyObject = 1, funcAddingAttribute: ((value: AnyObject, range: NSRange) -> Void)) {
        let inputLength = string.length
        let searchLength = searchString.length
        var range = NSRange(location: 0, length: length)
        while range.location != NSNotFound {
            range = (string as NSString).range(of: searchString, options: [], range: range)
            if range.location != NSNotFound {
                funcAddingAttribute(value: value, range: NSRange(location: range.location, length: searchLength))
                range = NSRange(location: range.location + range.length, length: inputLength - (range.location + range.length))
            }
        }
    }

    private func setTextColor(value: AnyObject, range: NSRange) {
        addAttribute(NSForegroundColorAttributeName, value: value, range: range)
    }

    private func setTextStrike(value: AnyObject = 1, range: NSRange) {
        addAttribute(NSStrikethroughStyleAttributeName, value: value, range: range)
    }

    private func setTextUnderline(value: AnyObject = 1, range: NSRange) {
        addAttribute(NSUnderlineStyleAttributeName, value: value, range: range)
    }
}
