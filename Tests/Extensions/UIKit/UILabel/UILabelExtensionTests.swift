//
//  UILabelExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 17/11/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS)
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

// MARK: - Truncatated

extension UILabelExtensionTests {

    func testIsTruncated() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        label.text = "I will be truncated :("
        XCTAssertTrue(label.isTruncated())

        label.text = ":)"
        XCTAssertFalse(label.isTruncated())

        label.text = nil
        XCTAssertFalse(label.isTruncated())
    }

    func testTruncateWithCustomSuffix() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        label.setText("I will be truncated :(", truncatedText: ".")
        XCTAssertEqual(label.text?.last, ".")

        label.setText(":)", truncatedText: ".")
        XCTAssertNotEqual(label.text?.last, ".")
    }

}

// MARK: - Fonts

extension UILabelExtensionTests {

    @available(iOS 11.0, tvOS 11.0, *)
    func testConfigureDynamicStyle() {
        let font = UIFont.dynamicStyle(.body, traits: .traitBold)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 40))
        label.configureDynamicStyle(.body, traits: .traitBold, minimumScaleFactor: 0.5)
        XCTAssertTrue(label.adjustsFontForContentSizeCategory)
        XCTAssertTrue(label.adjustsFontSizeToFitWidth)
        XCTAssertTrue(label.allowsDefaultTighteningForTruncation)
        XCTAssertEqual(label.font, font)

    }

}
#endif
