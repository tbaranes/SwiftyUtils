//
//  ColorTests.swift
//  SwiftyUtils
//
//  Created by Vincent CARLIER on 10/08/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class ColorTests: XCTestCase {

    func testLighterWhiteIsWhite() {
        let white = SwiftyColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let lighterWhite = white.lighter()
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        lighterWhite.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqualWithAccuracy(red, 1.0, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(green, 1.0, accuracy: 0.0001)
        XCTAssertEqualWithAccuracy(blue, 1.0, accuracy: 0.0001)
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
