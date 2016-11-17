//
//  Created by Tom Baranes on 23/06/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class SwiftyColorTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Components

#if !os(OSX)

extension SwiftyColorTests {

    func testValidHexColor() {
        let color = SwiftyColor(hex: "FFFFFFFEFEFEZAZF")
        XCTAssertNotNil(color)
    }

    func testInvalidHexColor() {
        let color = SwiftyColor(hex: "FFFFFF")
        XCTAssertNotNil(color)
    }

    func testRedComponent() {
        let color = SwiftyColor.red
        XCTAssertEqual(color.redComponent, 255)
    }

    func testGreenComponent() {
        let color = SwiftyColor.green
        XCTAssertEqual(color.greenComponent, 255)
    }

    func testBlueComponent() {
        let color = SwiftyColor.blue
        XCTAssertEqual(color.blueComponent, 255)
    }

    func testAlpha() {
        let expectedAlpha: CGFloat = 0.5
        let color = SwiftyColor.black.withAlphaComponent(expectedAlpha)
        XCTAssertEqual(color.alpha, expectedAlpha)
    }

}

#endif

// MARK: - Brigthness

extension SwiftyColorTests {

    func testLighterWhiteIsWhite() {
        let white = SwiftyColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let lighterWhite = white.lighter()

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        lighterWhite.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        #if os(OSX)
            XCTAssertEqualWithAccuracy(red, 1.0, accuracy: 0.0001)
            XCTAssertEqualWithAccuracy(green, 1.0, accuracy: 0.0001)
            XCTAssertEqualWithAccuracy(blue, 1.0, accuracy: 0.0001)
        #elseif os(iOS)
            if #available(iOS 10.0, *) {
                XCTAssertEqualWithAccuracy(red, 1.25, accuracy: 0.0001)
                XCTAssertEqualWithAccuracy(green, 1.25, accuracy: 0.0001)
                XCTAssertEqualWithAccuracy(blue, 1.25, accuracy: 0.0001)
            } else {
                XCTAssertEqualWithAccuracy(red, 1.0, accuracy: 0.0001)
                XCTAssertEqualWithAccuracy(green, 1.0, accuracy: 0.0001)
                XCTAssertEqualWithAccuracy(blue, 1.0, accuracy: 0.0001)
            }
        #endif
        XCTAssertEqualWithAccuracy(alpha, 1.0, accuracy: 0.0001)
    }

    func testDarkerBlackIsBlack() {
        let black = SwiftyColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        let darkerBlack = black.darker()

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        darkerBlack.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqualWithAccuracy(red, 0.0, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(green, 0.0, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(blue, 0.0, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(alpha, 1.0, accuracy: 0.0001)
    }

    func testLighterColor() {
        let color = SwiftyColor(red: 0.5, green: 0.8, blue: 0.8, alpha: 1.0)
        let lighterColor = color.lighter()

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        lighterColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqualWithAccuracy(red, 0.625, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(green, 1.0, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(blue, 1.0, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(alpha, 1.0, accuracy: 0.0001)
    }

    func testDarkerColor() {
        let color = SwiftyColor(red: 0.5, green: 0.8, blue: 0.8, alpha: 1.0)
        let darkerColor = color.darker()

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        darkerColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqualWithAccuracy(red, 0.375, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(green, 0.6, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(blue, 0.6, accuracy: 0.0001)
        XCTAssertEqual(alpha, 1.0)
    }

}
