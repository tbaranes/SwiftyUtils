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
    @available(*, deprecated, message: "Use `validateEmailAddress()` instead")
    public var isEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

    /// These values are given in soft language intentionally because email validation is highly varied and many
    /// places are too strict. The support level is based on authors anecdotal experiences.
    public enum EmailSupport: Int, Equatable, Comparable {
        case widelySupported
        case mostlySupported
        case technicallySupported

        public static func < (lhs: String.EmailSupport, rhs: String.EmailSupport) -> Bool {
            lhs.rawValue < rhs.rawValue
        }
    }

    /// By RFC 5322, should be MOSTLY correct and cover the most common use cases. It turns out email validation
    /// is *very* complicated. The more esoteric valid emails might/will not be validated as correct. Aka, some false
    /// negatives are expected, but false positives should not happen.
    ///
    /// Note: ios, tvos, and watch os availability is a guess as I don't have those sdks installed to confirm.
    @available(macOS 13, iOS 16, tvOS 16, watchOS 10, *)
    @discardableResult // swiftlint:disable:next function_body_length
    public func validateEmailAddress(requireTLD: Bool = true) throws -> EmailSupport {
        guard 3...255 ~= count else { throw EmailError.invalidLength }

        // swiftlint:disable:next cyclomatic_complexity function_body_length large_tuple
        func parseEmailSections() throws -> (local: String, domain: String, supportLevel: EmailSupport) {
            var local = ""
            var domain = ""
            var supportLevel = EmailSupport.widelySupported

            let escapeAndAt = CharacterSet("\\@".unicodeScalars)
            let quotes = CharacterSet("\"".unicodeScalars)
            let space = CharacterSet(" ".unicodeScalars)
            let nothing = CharacterSet()
            let localStoppers = escapeAndAt.union(quotes).union(space)

            var inQuotes = false
            var finishedLocal = false
            let scanner = Scanner(string: self)
            scanner.charactersToBeSkipped = nil
            while scanner.isAtEnd == false {
                if finishedLocal {
                    guard
                        let partial = scanner.scanUpToCharacters(from: nothing)
                    else { throw EmailError.invalidFormat }
                    domain = partial
                } else {
                    var partial = ""
                    if let scanned = scanner.scanUpToCharacters(from: localStoppers) {
                        partial = scanned
                    }

                    defer { local.append(partial) }

                    guard
                        let character = scanner.scanCharacter()
                    else { throw EmailError.invalidFormat }

                    switch character {
                    case "\\":
                        guard inQuotes == true else { throw EmailError.escapesAndSpacesOnlyAllowedWithinQuotes }
                        guard
                            let next = scanner.scanCharacter()
                        else { throw EmailError.escapedSequenceUnfinished }
                        partial.append(character)
                        partial.append(next)
                        supportLevel = max(supportLevel, .technicallySupported)
                    case "@":
                        guard inQuotes == false else { continue }
                        finishedLocal = true
                    case "\"":
                        partial.append(character)
                        if inQuotes == false {
                            inQuotes = true
                        } else {
                            inQuotes = false
                            guard
                                scanner.scanString("@") != nil
                            else { throw EmailError.quotesMustCoverEntireLocalSection }
                            // back up one character since @ check was successful
                            scanner.currentIndex = index(before: scanner.currentIndex)
                        }
                        supportLevel = max(supportLevel, .technicallySupported)
                    case " ":
                        guard inQuotes == true else { throw EmailError.escapesAndSpacesOnlyAllowedWithinQuotes }
                        supportLevel = max(supportLevel, .technicallySupported)
                    default:
                        throw EmailError.scannerError
                    }
                }
            }
            return (local, domain, supportLevel)
        }

        let info = try parseEmailSections()
        let local = info.local
        let domain = info.domain
        var supportLevel = info.supportLevel

        guard 1...64 ~= local.count else { throw EmailError.localSectionInvalidLength }

        guard local.first != "." && local.last != "." else { throw EmailError.localSectionStartsOrEndsWithDot }

        guard local.contains("..") == false else { throw EmailError.localSectionHasConsecutiveDots }

        try domain.validateDomain(requireTLD: requireTLD)

        if local.contains(/\+/) {
            supportLevel = max(supportLevel, .mostlySupported)
        }

        if local.contains(/[\/\=\!\%\$]/) {
            supportLevel = max(supportLevel, .technicallySupported)
        }

        if requireTLD == false && domain.contains(".") == false {
            supportLevel = max(supportLevel, .technicallySupported)
        }

        return supportLevel
    }

    public enum EmailError: String, Error, CustomStringConvertible {
        case quotesMustCoverEntireLocalSection
        case escapesAndSpacesOnlyAllowedWithinQuotes
        case invalidFormat
        case escapedSequenceUnfinished
        case scannerError
        case noAtSign
        case invalidLength
        case localSectionInvalidLength
        case localSectionStartsOrEndsWithDot
        case localSectionHasConsecutiveDots

        public var description: String {
            "\(EmailError.self).\(rawValue)"
        }
    }

    @available(macOS 13, iOS 16, tvOS 16, watchOS 10, *)
    public func validateDomain(requireTLD: Bool = true) throws {
        guard 1...253 ~= count else { throw DomainError.invalidLength }
        guard contains("..") == false else { throw DomainError.hasConsecutiveDots }

        if requireTLD {
            guard contains(".") else { throw DomainError.hasNoTLD }
        }

        if hasPrefix(".") || hasSuffix(".") {
            throw DomainError.startsOrEndsWithDot
        }

        if hasPrefix("-") || hasSuffix("-") {
            throw DomainError.startsOrEndsWithHyphen
        }

        let illegalSubdomains = split(separator: ".")
            .filter { $0.count > 63 }

        guard illegalSubdomains.isEmpty else { throw DomainError.hasSectionWithInvalidCharacterCount }

        let domainRegex = /^[A-Za-z0-9\-\.]+$/
        guard wholeMatch(of: domainRegex) != nil else {
            throw DomainError.hasInvalidCharacters
        }
    }

    public enum DomainError: String, Error, CustomStringConvertible {
        case invalidLength
        case hasConsecutiveDots
        case hasNoTLD
        case hasInvalidCharacters
        case startsOrEndsWithDot
        case startsOrEndsWithHyphen
        case hasSectionWithInvalidCharacterCount

        public var description: String {
            "\(DomainError.self).\(rawValue)"
        }
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
