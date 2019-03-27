//
//  UITextFieldExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 11/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest

// MARK: Life cycle

final class UITextFieldExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - Placeholder

extension UITextFieldExtensionTests {

    func testSetPlaceHolderTextColor() {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Attributed Placeholder")
        textField.setPlaceHolderTextColor(.blue)
        let color = textField.attributedPlaceholder?.attribute(NSAttributedString.Key.foregroundColor, at: 0, effectiveRange: nil) as? UIColor
        XCTAssertEqual(color, .blue)

        textField.placeholder = nil
        textField.setPlaceHolderTextColor(.yellow)
        let emptyColor = textField.attributedPlaceholder?.attribute(NSAttributedString.Key.foregroundColor, at: 0, effectiveRange: nil) as? UIColor
        XCTAssertNil(emptyColor)
    }

}
