//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation
#if os(macOS)
    import Cocoa
#else
    import UIKit
#endif

// MARK - Color

public extension NSMutableAttributedString {

    public static func colored(inText text: String, color: SwiftyColor, afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.color(color, afterOcurrence: occurence)
        return attrStr
    }

    public static func colored(inText text: String, color: SwiftyColor, occurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.color(color, occurences: searchString)
        return attrStr
    }

    public func color(_ color: SwiftyColor, afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            addColorAttribute(value: color, range: range)
        }
    }

    public func color(_ color: SwiftyColor, occurences searchString: String) {
        addAttribute(forOccurence: searchString, value: color, addAttributeMethod: addColorAttribute)
    }

}

// MARK - Strike

public extension NSMutableAttributedString {

    public static func struck(inText text: String, afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.strike(afterOcurrence: occurence)
        return attrStr
    }

    public static func struck(inText text: String, occurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.strike(occurences: searchString)
        return attrStr
    }

    public func strike(afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            addStrikeAttribute(range: range)
        }
    }

    public func strike(occurences searchString: String) {
        addAttribute(forOccurence: searchString, addAttributeMethod: addStrikeAttribute)
    }

}

// MARK - Underline

public extension NSMutableAttributedString {

    public static func underlined(inText text: String, afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.underline(afterOcurrence: occurence)
        return attrStr
    }

    public static func underlined(inText text: String, occurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.underline(occurences: searchString)
        return attrStr
    }

    public func underline(afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            addUnderlineAttribute(range: range)
        }
    }

    public func underline(occurences searchString: String) {
        addAttribute(forOccurence: searchString, addAttributeMethod: addStrikeAttribute)
    }

}

// MARK - Private

fileprivate extension NSMutableAttributedString {

    func addColorAttribute(value: Any, range: NSRange) {
        addAttribute(NSForegroundColorAttributeName, value: value, range: range)
    }

    func addStrikeAttribute(value: Any = 1, range: NSRange) {
        addAttribute(NSStrikethroughStyleAttributeName, value: value, range: range)
    }

    func addUnderlineAttribute(value: Any = 1, range: NSRange) {
        addAttribute(NSUnderlineStyleAttributeName, value: value, range: range)
    }

    func addAttribute(forOccurence searchString: String,
                      value: Any = 1,
                      addAttributeMethod: ((_ value: Any, _ range: NSRange) -> Void)) {
        let inputLength = string.length
        let searchLength = searchString.length
        var range = NSRange(location: 0, length: length)
        while range.location != NSNotFound {
            range = (string as NSString).range(of: searchString, options: [], range: range)
            if range.location != NSNotFound {
                addAttributeMethod(value, NSRange(location: range.location, length: searchLength))
                range = NSRange(location: range.location + range.length, length: inputLength - (range.location + range.length))
            }
        }
    }

}
