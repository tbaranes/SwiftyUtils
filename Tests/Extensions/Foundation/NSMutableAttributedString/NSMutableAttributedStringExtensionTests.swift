//
//  NSMutableAttributedStringExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class NSMutableAttributedStringExtensionTests: XCTestCase {

}

// MARK: - Color

extension NSMutableAttributedStringExtensionTests {

    func testColorForText() {
        let string = "Hello"
        let color = SwiftyColor.red
        let attrString = NSMutableAttributedString.colored(inText: string, color: color, occurences: string)

        let range = NSRange(location: 0, length: string.count - 1)
        let fontAttribute = attrString.attributes(at: 1, longestEffectiveRange: nil, in: range)
        XCTAssertEqual(fontAttribute[NSAttributedString.Key.foregroundColor] as? SwiftyColor, color)
    }

    func testColorAfterOccurence() {
        let begin = "Hello"
        let middle = "World"
        let end = " !"
        let fullString = begin + middle + end
        let color = SwiftyColor.red
        let attrString = NSMutableAttributedString.colored(inText: fullString, color: color, afterOcurrence: begin)

        let range = NSRange(location: begin.count - 1, length: middle.count)
        var fontAttribute = attrString.attributes(at: 1, longestEffectiveRange: nil, in: range)
        XCTAssertEqual(fontAttribute[NSAttributedString.Key.foregroundColor] as? SwiftyColor, color)

        fontAttribute = attrString.attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0,
                                                                                             length: middle.count - 1))
        XCTAssertNotEqual(fontAttribute[NSAttributedString.Key.foregroundColor] as? SwiftyColor, color)
    }

}

// MARK: - Strike

extension NSMutableAttributedStringExtensionTests {

    func testStrikeForText() {
        let string = "Hello"
        let attrString = NSMutableAttributedString.struck(inText: string, occurences: string)

        let range = NSRange(location: 0, length: string.count - 1)
        let fontAttribute = attrString.attributes(at: 1, longestEffectiveRange: nil, in: range)
        XCTAssertEqual(fontAttribute[NSAttributedString.Key.strikethroughStyle] as? Int, 1)
    }

    func testStrikeAfterOccurence() {
        let begin = "Hello"
        let middle = "World"
        let end = " !"
        let fullString = begin + middle + end
        let attrString = NSMutableAttributedString.struck(inText: fullString, afterOcurrence: begin)

        let range = NSRange(location: begin.count - 1, length: middle.count)
        var attributes = attrString.attributes(at: 1, longestEffectiveRange: nil, in: range)
        XCTAssertEqual(attributes[NSAttributedString.Key.strikethroughStyle] as? Int, 1)

        attributes = attrString.attributes(at: 0,
                                           longestEffectiveRange: nil,
                                           in: NSRange(location: 0,
                                                       length: middle.count - 1))
        XCTAssertNotEqual(attributes[NSAttributedString.Key.strikethroughStyle] as? Int, 1)
    }

}

// MARK: - Font

extension NSMutableAttributedStringExtensionTests {

    func testFontForText() {
        let string = "Hello"
        let font = SwiftyFont.boldSystemFont(ofSize: 16)
        let attrString = NSMutableAttributedString.font(inText: string, font: font, occurences: string)

        let range = NSRange(location: 0, length: string.count - 1)
        let fontAttribute = attrString.attributes(at: 1, longestEffectiveRange: nil, in: range)
        XCTAssertEqual(fontAttribute[NSAttributedString.Key.font] as? SwiftyFont, font)
    }

    func testFontAfterOccurence() {
        let begin = "Hello"
        let middle = "World"
        let end = " !"
        let fullString = begin + middle + end
        let font = SwiftyFont.boldSystemFont(ofSize: 18)
        let attrString = NSMutableAttributedString.font(inText: fullString, font: font, afterOcurrence: begin)

        let range = NSRange(location: begin.count - 1, length: middle.count)
        var fontAttribute = attrString.attributes(at: 1, longestEffectiveRange: nil, in: range)
        XCTAssertEqual(fontAttribute[NSAttributedString.Key.font] as? SwiftyFont, font)

        fontAttribute = attrString.attributes(at: 0, longestEffectiveRange: nil, in: NSRange(location: 0,
                                                                                             length: middle.count - 1))
        XCTAssertNotEqual(fontAttribute[NSAttributedString.Key.font] as? SwiftyFont, font)
    }

}

// MARK: - Underline

extension NSMutableAttributedStringExtensionTests {

    func testUnderlineForText() {
        let string = "Hello"
        let attrString = NSMutableAttributedString.underlined(inText: string, occurences: string)

        let range = NSRange(location: 0, length: string.count - 1)
        let attributes = attrString.attributes(at: 1, longestEffectiveRange: nil, in: range)
        XCTAssertEqual(attributes[NSAttributedString.Key.underlineStyle] as? Int, 1)
    }

    func testUnderlineAfterOccurence() {
        let begin = "Hello"
        let middle = "World"
        let end = " !"
        let fullString = begin + middle + end
        let attrString = NSMutableAttributedString.underlined(inText: fullString, afterOcurrence: begin)

        let range = NSRange(location: begin.count - 1, length: middle.count)
        var attributes = attrString.attributes(at: 1, longestEffectiveRange: nil, in: range)
        XCTAssertEqual(attributes[NSAttributedString.Key.underlineStyle] as? Int, 1)

        attributes = attrString.attributes(at: 0,
                                           longestEffectiveRange: nil,
                                           in: NSRange(location: 0,
                                                       length: middle.count - 1))
        XCTAssertNotEqual(attributes[NSAttributedString.Key.underlineStyle] as? Int, 1)
    }

}
