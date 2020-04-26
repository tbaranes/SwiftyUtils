//
//  UITextViewExtensionTests.swift
//  SwiftyUtils iOS Tests
//
//  Created by Tom Baranes on 26/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

// MARK: Life cycle

final class UITextViewExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Fonts

extension UITextViewExtensionTests {

    @available(iOS 11.0, *)
    func testConfigureDynamicStyle() {
        let font = UIFont.dynamicStyle(.body, traits: .traitBold)
        let textField = UITextField()
        textField.configureDynamicStyle(.body, traits: .traitBold)
        XCTAssertTrue(textField.adjustsFontForContentSizeCategory)
        XCTAssertEqual(textField.font, font)

    }

}
