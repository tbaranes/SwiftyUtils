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

// MARK: - Color

extension NSMutableAttributedString {

    /// Create a `NSMutableAttributedString` with a `foregroundColor` applied after a specified occurence.
    /// - Parameters:
    ///     - text: The attributed string text.
    ///     - color: The color that will be applied to the attribute.
    ///     - occurence: The part of the text where the attribute won't be applied.
    /// - Returns: The new NSMutableAttributedString.
    public static func colored(inText text: String,
                               color: SwiftyColor,
                               afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.color(color, afterOcurrence: occurence)
        return attrStr
    }

    /// Create a `NSMutableAttributedString` with a `foregroundColor` attribute
    /// applied on each occurence of a specified text.
    /// - Parameters:
    ///     - text: The attributed string text.
    ///     - color: The color that will be applied to each occurence.
    ///     - searchString: The text on which the attribute will be applied (for each occurences found).
    /// - Returns: The new NSMutableAttributedString.
    public static func colored(inText text: String,
                               color: SwiftyColor,
                               occurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.color(color, occurences: searchString)
        return attrStr
    }

    /// Add a `foregroundColor` attribute for each occurence of a specified text in the `NSMutableAttributedString`.
    /// - Parameters:
    ///     - color: The color that will be applied to the attribute.
    ///     - searchString: The text on which the attribute will be applied (for each occurences found).
    public func color(_ color: SwiftyColor,
                      afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            addColorAttribute(value: color, range: range)
        }
    }

    /// Add a `foregroundColor` attribute for each occurence of a specified text in the `NSMutableAttributedString`.
    /// - Parameters:
    ///     - color: The color that will be applied to each occurence.
    ///     - searchString: The text on which the attribute will be applied (for each occurences found).
    public func color(_ color: SwiftyColor, occurences searchString: String) {
        addAttribute(forOccurence: searchString, value: color, addAttributeMethod: addColorAttribute)
    }

}

// MARK: - Strike

extension NSMutableAttributedString {

    /// Create a `NSMutableAttributedString` with a `strikethroughStyle` applied after a specified occurence.
    /// - Parameters:
    ///     - text: The attributed string text.
    ///     - occurence: The part of the text where the attribute won't be applied.
    /// - Returns: The new NSMutableAttributedString.
    public static func struck(inText text: String, afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.strike(afterOcurrence: occurence)
        return attrStr
    }

    /// Create a `NSMutableAttributedString` with a `strikethroughStyle` attribute
    /// applied on each occurence of a specified text.
    /// - Parameters:
    ///     - text: The attributed string text.
    ///     - searchString: The text on which the attribute will be applied (for each occurences found).
    /// - Returns: The new NSMutableAttributedString.
    public static func struck(inText text: String, occurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.strike(occurences: searchString)
        return attrStr
    }

    /// Add a `strikethroughStyle` attribute after a specified occurence in the `NSMutableAttributedString`.
    /// - Parameter occurence: The part of the text where the attribute won't be applied.
    public func strike(afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            addStrikeAttribute(range: range)
        }
    }

    /// Add a `strikethroughStyle` attribute for each occurence of a specified text in the `NSMutableAttributedString`.
    /// - Parameter searchString: The text on which the attribute will be applied (for each occurences found).
    public func strike(occurences searchString: String) {
        addAttribute(forOccurence: searchString, addAttributeMethod: addStrikeAttribute)
    }

}

// MARK: - Underline

extension NSMutableAttributedString {

    /// Create a `NSMutableAttributedString` with a `underlineStyle` applied after a specified occurence.
    /// - Parameters:
    ///     - text: The attributed string text.
    ///     - occurence: The part of the text where the attribute won't be applied.
    /// - Returns: The new NSMutableAttributedString.
    public static func underlined(inText text: String, afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.underline(afterOcurrence: occurence)
        return attrStr
    }

    /// Create a `NSMutableAttributedString` with an `underlineStyle` attribute
    /// applied on each occurence of a specified text.
    /// - Parameters:
    ///     - text: The attributed string text.
    ///     - searchString: The text on which the attribute will be applied (for each occurences found).
    /// - Returns: The new NSMutableAttributedString.
    public static func underlined(inText text: String, occurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.underline(occurences: searchString)
        return attrStr
    }

    /// Add an `underlineStyle` attribute after a specified occurence in the `NSMutableAttributedString`.
    /// - Parameter occurence: The part of the text where the attribute won't be applied.
    public func underline(afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            addUnderlineAttribute(range: range)
        }
    }

    /// Add an `underlineStyle` attribute for each occurence of a specified text in the `NSMutableAttributedString`.
    /// - Parameter searchString: The text on which the attribute will be applied (for each occurences found).
    public func underline(occurences searchString: String) {
        addAttribute(forOccurence: searchString, addAttributeMethod: addUnderlineAttribute(value:range:))
    }

}

// MARK: - Font

extension NSMutableAttributedString {

    /// Create a `NSMutableAttributedString` with a `font` applied after a specified occurence.
    /// - Parameters:
    ///     - text: The attributed string text.
    ///     - font: The font that will be applied to the attribute.
    ///     - occurence: The part of the text where the attribute won't be applied.
    /// - Returns: The new NSMutableAttributedString.
    public static func font(inText text: String,
                            font: SwiftyFont,
                            afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.font(font, afterOcurrence: occurence)
        return attrStr
    }

    /// Create a `NSMutableAttributedString` with a `font` attribute applied on each occurence of a specified text.
    /// - Parameters:
    ///     - text: The attributed string text.
    ///     - font: The font that will be applied to each occurence.
    ///     - searchString: The text on which the attribute will be applied (for each occurences found).
    /// - Returns: The new NSMutableAttributedString.
    public static func font(inText text: String,
                            font: SwiftyFont,
                            occurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.font(font, occurences: searchString)
        return attrStr
    }

    /// Add a `font` attribute after a specified occurence in the `NSMutableAttributedString`.
    /// - Parameters:
    ///     - font: The font that will be applied to the attribute.
    ///     - occurence: The part of the text where the attribute won't be applied.
    public func font(_ font: SwiftyFont, afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            addFontAttribute(value: font, range: range)
        }
    }

    /// Add a `font` attribute for each occurence of a specified text in the `NSMutableAttributedString`.
    /// - Parameters:
    ///     - font: The font that will be applied to each occurence.
    ///     - searchString: The text on which the attribute will be applied (for each occurences found).
    public func font(_ font: SwiftyFont, occurences searchString: String) {
        addAttribute(forOccurence: searchString, value: font, addAttributeMethod: addFontAttribute)
    }

}

// MARK: - Private

extension NSMutableAttributedString {

    func addColorAttribute(value: Any, range: NSRange) {
        addAttribute(NSAttributedString.Key.foregroundColor, value: value, range: range)
    }

    func addStrikeAttribute(value: Any = 1, range: NSRange) {
        addAttribute(NSAttributedString.Key.strikethroughStyle, value: value, range: range)
    }

    func addUnderlineAttribute(value: Any = 1, range: NSRange) {
        addAttribute(NSAttributedString.Key.underlineStyle, value: value, range: range)
    }

    func addFontAttribute(value: Any = 1, range: NSRange) {
        addAttribute(NSAttributedString.Key.font, value: value, range: range)
    }

    private func addAttribute(forOccurence searchString: String,
                              value: Any = 1,
                              addAttributeMethod: ((_ value: Any, _ range: NSRange) -> Void)) {
        let inputLength = string.count
        let searchLength = searchString.count
        var range = NSRange(location: 0, length: length)
        while range.location != NSNotFound {
            range = (string as NSString).range(of: searchString, options: [], range: range)
            if range.location != NSNotFound {
                addAttributeMethod(value, NSRange(location: range.location, length: searchLength))
                range = NSRange(location: range.location + range.length,
                                length: inputLength - (range.location + range.length))
            }
        }
    }

}
