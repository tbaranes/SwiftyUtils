// NSAttributedStringExtension.swift
//
// Copyright (c) 2016 Tom Baranes
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
#if os(iOS) || os (tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

public extension NSMutableAttributedString {
    
    // MARK - Colors
    
    public static func setTextColor(text: String, color: TBColor, afterOcurrence occurence: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.setTextColor(color, afterOcurrence: occurence)
        return attrStr
    }
    
    public static func setTextColor(text: String, color: TBColor, forOccurences searchString: String) -> NSMutableAttributedString {
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.setTextColor(color, forOccurences: searchString)
        return attrStr
    }
    
    public func setTextColor(color: TBColor, afterOcurrence occurence: String) {
        let range = NSRange(text: string, afterOccurence: occurence)
        if range.location != NSNotFound {
            setTextColor(color, range: range)
        }
    }
    
    public func setTextColor(color: TBColor, forOccurences searchString: String) {
        addAttributeForOccurence(searchString, value: color, funcAddingAttribute: setTextColor)
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
        addAttributeForOccurence(searchString, funcAddingAttribute: setTextStrike)
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
        addAttributeForOccurence(searchString, funcAddingAttribute: setTextUnderline)
    }
    
    // MARK - Private
    
    private func addAttributeForOccurence(searchString: String, value: AnyObject = 1, funcAddingAttribute: ((value: AnyObject, range: NSRange) -> Void)) {
        let inputLength = string.length
        let searchLength = searchString.length
        var range = NSRange(location: 0, length: length)
        while range.location != NSNotFound {
            range = (string as NSString).rangeOfString(searchString, options: [], range: range)
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