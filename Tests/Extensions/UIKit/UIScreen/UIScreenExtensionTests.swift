//
//  UIScreenExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if os(iOS)
import UIKit
import XCTest
import SwiftyUtils

// MARK: Life cycle

final class UIScreenExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Size

extension UIScreenExtensionTests {

    func testSize() {
        XCTAssertEqual(UIScreen.size,
                       CGSize(width: UIScreen.main.bounds.size.width,
                              height: UIScreen.main.bounds.size.height))
    }

    func testWidth() {
        XCTAssertEqual(UIScreen.width, UIScreen.main.bounds.size.width)
    }

    func testHeight() {
        XCTAssertEqual(UIScreen.height, UIScreen.main.bounds.size.height)
    }

}
#endif
