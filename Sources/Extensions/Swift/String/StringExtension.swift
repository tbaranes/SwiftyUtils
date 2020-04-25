//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Subscript

extension String {

    /// A subscript to get the character at a specified index.
    /// - Parameter integerIndex: The index of the character that we search for.
    /// - Returns: The character found at the specified index.
    public subscript(integerIndex: Int) -> Character {
        self[index(startIndex, offsetBy: integerIndex)]
    }

    /// A subscript to get a substring at a specified range.
    /// - Parameter integerRange: The range that will be used to find the substring.
    /// - Returns: The substring corresponding to the specified range.
    public subscript(integerRange: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: integerRange.lowerBound)
        let end = index(startIndex, offsetBy: integerRange.upperBound)
        return String(self[start..<end])
    }

}

// MARK: - Misc

extension String {

    /// Check if a string contains a text with dedicated options.
    /// - Parameters:
    ///   - text: The text to search for.
    ///   - compareOptions: The options available to many of the string classes’ search and comparison methods.
    public func contains(_ text: String, compareOption: NSString.CompareOptions) -> Bool {
        self.range(of: text, options: compareOption) != nil
    }

}

// MARK: - Validator

extension String {

    /// Check if the string contains only numeric numbers or not.
    public var isNumeric: Bool {
        let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
        let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
        return hasNumbers && !hasLetters
    }

    /// Check if the string contains an email email with a valid format.
    public var isEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

}

// MARK: - IP Validator

extension String {

    /// Check if the string contains an IP4 address.
    public var isIP4Address: Bool {
        confirmIP4isValid(ip4: self)
    }

    /// Check if the string contains an IP6 address.
    public var isIP6Address: Bool {
        confirmIP6isValid(ip6: self)
    }

    /// Check if the string contains an IP4 or an IP6 address.
    public var isIPAddress: Bool {
        confirmIP4isValid(ip4: self) || confirmIP6isValid(ip6: self)
    }

    private func confirmIP4isValid(ip4: String) -> Bool {
        var sin = sockaddr_in()
        return ip4.withCString { cstring in inet_pton(AF_INET, cstring, &sin.sin_addr) } == 1
    }

    private func confirmIP6isValid(ip6: String) -> Bool {
        var sin6 = sockaddr_in6()
        return ip6.withCString { cstring in inet_pton(AF_INET6, cstring, &sin6.sin6_addr) } == 1
    }

}

// MARK: - Computed Properties

extension String {

    /// Uncamelized the string.
    public var uncamelized: String {
        let upperCase = CharacterSet.uppercaseLetters
        return self.unicodeScalars.map { upperCase.contains($0) ? "_" + String($0).lowercased(): String($0) }
                                  .joined()
    }

    /// Capitalized first character of the String.
    public var capitalizedFirst: String {
        let first = prefix(1).capitalized
        let other = dropFirst()
        return first + other
    }

    /// Remove all the white spaces and newlines from the String.
    public mutating func trim() {
        self = trimmed()
    }

    /// Truncate the string if it's number of character go beyong a specified limit.
    /// - Parameter limit: The number max of characters in the String.
    public mutating func truncate(limit: Int) {
        self = truncated(limit: limit)
    }

}

// MARK: - Transform

extension String {

    /// Capitalized first character of the String.
    /// - Returns: The String trimmed.
    public func trimmed() -> String {
        components(separatedBy: NSCharacterSet.whitespacesAndNewlines).joined()
    }

    /// Truncate the string if it's number of character go beyong a specified limit.
    /// - Parameter limit: The number max of characters in the String.
    /// - Returns: The string truncated.
    public func truncated(limit: Int) -> String {
        if self.count > limit {
            var truncatedString = self[0..<limit]
            truncatedString = truncatedString.appending("...")
            return truncatedString
        }
        return self
    }

    /// Split the string in several substrings of a specified size.
    /// - Parameter chunkSize: The size of each substring.
    /// - Returns: An array containing all the substrings.
    public func split(intoChunksOf chunkSize: Int) -> [String] {
        var output = [String]()
        let splittedString = Array(self).split(intoChunksOf: chunkSize)
        splittedString.forEach {
            output.append($0.map { String($0) }.joined())
        }
        return output
    }

}
