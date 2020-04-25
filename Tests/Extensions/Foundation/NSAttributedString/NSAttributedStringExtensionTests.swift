//
//  NSAttributedStringExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest

final class NSAttributedStringTests: XCTestCase {

    // MARK: Properties

    let text = "other "
    let underlineText = "underlined"
    var attrString: NSMutableAttributedString!

    // MARK: Life Cycle

    override func setUp() {
        super.setUp()
        attrString = NSMutableAttributedString(string: text + underlineText)
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Font

extension NSAttributedStringTests {

    func testIsAttributeActive() {
        attrString.underline(occurences: underlineText)
        XCTAssertTrue(attrString.isAttributeActivated(.underlineStyle, appliedOn: underlineText, value: 1))
        XCTAssertFalse(attrString.isAttributeActivated(.underlineStyle, appliedOn: text, value: 1))
    }

}
