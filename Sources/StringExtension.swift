// StringExtension.swift
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

// MARK - Subscript

public extension String {
    
    public subscript(integerIndex: Int) -> Character {
        return self[startIndex.advancedBy(integerIndex)]
    }
    
    public subscript(integerRange: Range<Int>) -> String {
        let start = startIndex.advancedBy(integerRange.startIndex)
        let end = startIndex.advancedBy(integerRange.endIndex)
        let range = start..<end
        return self[range]
    }
    
}

// MARK - Helpers

public extension String {
    
    public var length: Int {
        return self.characters.count
    }
    
    public func isOnlyEmptySpacesAndNewLineCharacters() -> Bool {
        let characterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let newText = self.stringByTrimmingCharactersInSet(characterSet)
        return newText.isEmpty
    }

    func contains(find: String) -> Bool {
        return self.rangeOfString(find) != nil
    }

    public func contains(find: String, compareOption: NSStringCompareOptions) -> Bool {
        return self.rangeOfString(find, options: compareOption) != nil
    }
    
    public func containsEmoji() -> Bool {
        for i in 0...length {
            let c: unichar = (self as NSString).characterAtIndex(i)
            if (0xD800 <= c && c <= 0xDBFF) || (0xDC00 <= c && c <= 0xDFFF) {
                return true
            }
        }
        return false
    }

}

// MARK: - Getter

public extension String {
    
    public var extractURLs: [NSURL] {
        var urls: [NSURL] = []
        let detector: NSDataDetector?
        do {
            detector = try NSDataDetector(types: NSTextCheckingType.Link.rawValue)
        } catch _ as NSError {
            detector = nil
        }
        
        let text = self
        if let detector = detector {
            detector.enumerateMatchesInString(text, options: [], range: NSRange(location: 0, length: text.characters.count), usingBlock: {
                (result: NSTextCheckingResult?, flags: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                if let result = result,
                    let url = result.URL {
                    urls.append(url)
                }
            })
        }
        return urls
    }

}

// MARK: - Updating

public extension String {
    
    public mutating func trim() {
        self = trimmed()
    }
    
    public func trimmed() -> String {
        return componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).joinWithSeparator("")
    }
    
    public mutating func truncate(limit limit: Int) {
        self = truncated(limit: limit)
    }
    
    public func truncated(limit limit: Int) -> String {
        if self.length > limit {
            var truncatedString = self[0..<limit]
            truncatedString = truncatedString.stringByAppendingString("...")
            return truncatedString
        }
        return self
    }

    public var capitalizeFirst: String {
        var result = self
        result.replaceRange(startIndex...startIndex, with: String(self[startIndex]).capitalizedString)
        return result
    }
    
}

// MARk - Validator

public extension String {

    public func isNumber() -> Bool {
        if let _ = NumberFormatter.sharedInstance.numberFromString(self) {
            return true
        }
        return false
    }

    public var isEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluateWithObject(self)
    }

}