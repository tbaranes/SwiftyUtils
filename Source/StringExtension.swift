//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK - Subscript

public extension String {

    public subscript(integerIndex: Int) -> Character {
        return self[index(startIndex, offsetBy: integerIndex)]
    }

    public subscript(integerRange: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: integerRange.lowerBound)
        let end = index(startIndex, offsetBy: integerRange.upperBound)
        return self[start..<end]
    }

}

// MARK: - Init

public extension String {

    init?(value: Float, maxDigits: Int) {
        let numberFormatter = SUNumberFormatter.shared
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = maxDigits
        guard let string = numberFormatter.string(for: value) else {
            return nil
        }
        self = string
    }

    init?(value: Double, maxDigits: Int) {
        let numberFormatter = SUNumberFormatter.shared
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = maxDigits
        guard let string = numberFormatter.string(for: value) else {
            return nil
        }
        self = string
    }

}

// MARK - Helpers

public extension String {

    public var length: Int {
        return self.characters.count
    }

    public var isOnlyEmptySpacesAndNewLineCharacters: Bool {
        let characterSet = NSCharacterSet.whitespacesAndNewlines
        let newText = self.trimmingCharacters(in: characterSet)
        return newText.isEmpty
    }

    public func contains(_ text: String, compareOption: NSString.CompareOptions) -> Bool {
        return self.range(of: text, options: compareOption) != nil
    }

    public func containsEmoji() -> Bool {
        for i in 0...length {
            let c: unichar = (self as NSString).character(at: i)
            if (0xD800 <= c && c <= 0xDBFF) || (0xDC00 <= c && c <= 0xDFFF) {
                return true
            }
        }
        return false
    }

}

// MARK: - Getter

public extension String {

    public var extractedURLs: [URL] {
        var urls: [URL] = []
        let detector: NSDataDetector?
        do {
            detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        } catch _ as NSError {
            detector = nil
        }

        let text = self
        if let detector = detector {
            detector.enumerateMatches(in: text, options: [], range: NSRange(location: 0, length: text.characters.count), using: { result, _, _ in
                if let result = result,
                    let url = result.url {
                    urls.append(url as URL)
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
        return components(separatedBy: NSCharacterSet.whitespacesAndNewlines).joined(separator: "")
    }

    public mutating func truncate(limit: Int) {
        self = truncated(limit: limit)
    }

    public func truncated(limit: Int) -> String {
        if self.length > limit {
            var truncatedString = self[0..<limit]
            truncatedString = truncatedString.appending("...")
            return truncatedString
        }
        return self
    }

    public var capitalizedFirst: String {
        let result = replacingCharacters(in: Range(startIndex..<startIndex), with: String(self[startIndex]).capitalized)
        return result
    }

}

// MARk - Validator

public extension String {

    public var isNumber: Bool {
        if let _ = SUNumberFormatter.shared.number(from: self) {
            return true
        }
        return false
    }

    public var isEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

}
