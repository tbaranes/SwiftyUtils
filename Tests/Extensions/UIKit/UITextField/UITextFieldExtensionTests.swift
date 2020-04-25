//
//  UITextFieldExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 11/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

// MARK: Life cycle

final class UITextFieldExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Clear Button

extension UITextFieldExtensionTests {

    @available(iOS 13.0, *)
    func testSetClearButton() {
        let textField = UITextField()
        let image = UIImage(systemName: "pencil")!
        textField.setClearButton(with: image)
        XCTAssertEqual(textField.rightViewMode, .whileEditing)
        XCTAssertEqual(textField.clearButtonMode, .never)

        let clearButton = textField.rightView as? UIButton
        XCTAssertNotNil(clearButton)
        XCTAssertEqual(clearButton?.image(for: .normal), image)
        XCTAssertEqual(clearButton?.contentMode, .right)
        XCTAssertEqual(clearButton?.allTargets.count, 1)
    }

    func testClear() {
        let textField = UITextField()
        textField.text = "test"
        textField.clear()
        textField.text = ""
    }

}

// MARK: - Placeholder

extension UITextFieldExtensionTests {

    func testSetPlaceHolderTextColor() {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Attributed Placeholder")
        textField.setPlaceHolderTextColor(.blue)
        let color = textField.attributedPlaceholder?.attribute(NSAttributedString.Key.foregroundColor,
                                                               at: 0,
                                                               effectiveRange: nil) as? UIColor
        XCTAssertEqual(color, .blue)

        textField.placeholder = nil
        textField.setPlaceHolderTextColor(.yellow)
        let emptyColor = textField.attributedPlaceholder?.attribute(NSAttributedString.Key.foregroundColor,
                                                                    at: 0,
                                                                    effectiveRange: nil) as? UIColor
        XCTAssertNil(emptyColor)
    }

}
