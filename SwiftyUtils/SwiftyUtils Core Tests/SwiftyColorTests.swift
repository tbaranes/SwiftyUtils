//
//  SwiftyColorTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 23/06/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

class SwiftyColorTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

extension SwiftyColorTests {

    func testValidHexColor() {
        let color = SwiftyColor(hexString: "FFFFFFFEFEFEZAZF")
        XCTAssertNil(color)
    }

    func testInvalidHexColor() {
        let color = SwiftyColor(hexString: "FFFFFF")
        XCTAssertNotNil(color)
    }

    func testRedComponent() {
        let color = SwiftyColor.red()
        XCTAssertEqual(color.redComponent, 255)
    }

    func testGreenComponent() {
        let color = SwiftyColor.green()
        XCTAssertEqual(color.greenComponent, 255)
    }

    func testBlueComponent() {
        let color = SwiftyColor.blue()
        XCTAssertEqual(color.blueComponent, 255)
    }

    func testAlpha() {
        let expectedAlpha: CGFloat = 0.5
        let color = SwiftyColor.black().withAlphaComponent(expectedAlpha)
        XCTAssertEqual(color.alpha, expectedAlpha)
    }

}
