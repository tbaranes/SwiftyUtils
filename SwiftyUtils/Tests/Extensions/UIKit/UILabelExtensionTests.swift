//
//  UILabelExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 17/11/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit
import XCTest
import SwiftyUtils

// MARK: Life cycle

final class UILabelExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Tests

extension UILabelExtensionTests {

    func testIsTruncated() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        label.text = "I will be truncated :("
        XCTAssertTrue(label.isTruncated())

        label.text = ":)"
        XCTAssertFalse(label.isTruncated())
    }

    func testTruncateWithCustomSuffix() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        label.setText("I will be truncated :(", truncatedText: ".")
        XCTAssertEqual(label.text?.characters.last, ".")

        label.setText(":)", truncatedText: ".")
        XCTAssertNotEqual(label.text?.characters.last, ".")
    }

}
