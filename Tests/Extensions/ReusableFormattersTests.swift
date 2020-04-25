//
//  ReusableFormattersTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class ReusableFormattersTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Tests

extension UserDefaultsExtensionTests {

    func testReuseDateFormatter() {
        let formatter = SUDateFormatter.shared
        formatter.dateFormat = "YYYY"
        XCTAssertEqual(formatter.dateFormat, SUDateFormatter.shared.dateFormat)
    }

    func testReuseNumberFormatter() {
        let formatter = SUNumberFormatter.shared
        formatter.formatWidth = 3
        XCTAssertEqual(formatter.formatWidth, SUNumberFormatter.shared.formatWidth)
    }

    func testReuseByteFormatter() {
        let formatter = SUByteCountFormatter.shared
        formatter.formattingContext = .middleOfSentence
        XCTAssertEqual(formatter.formattingContext, SUByteCountFormatter.shared.formattingContext)
    }

    func testReuseDateComponentsFormatter() {
        let formatter = SUDateComponentsFormatter.shared
        formatter.allowedUnits = .day
        XCTAssertEqual(formatter.allowedUnits, SUDateComponentsFormatter.shared.allowedUnits)
    }

    func testReuseDateIntervalFormatter() {
        let formatter = SUDateIntervalFormatter.shared
        formatter.dateStyle = .medium
        XCTAssertEqual(formatter.dateStyle, SUDateIntervalFormatter.shared.dateStyle)
    }

    func testReuseEnergyIntervalFormatter() {
        let formatter = SUEnergyFormatter.shared
        formatter.isForFoodEnergyUse = true
        XCTAssertEqual(formatter.isForFoodEnergyUse, SUEnergyFormatter.shared.isForFoodEnergyUse)
    }

    func testReuseMassFormatter() {
        let formatter = SUMassFormatter.shared
        formatter.isForPersonMassUse = true
        XCTAssertEqual(formatter.isForPersonMassUse, SUMassFormatter.shared.isForPersonMassUse)
    }

    func testReuseLengthFormatter() {
        let formatter = SULengthFormatter.shared
        formatter.isForPersonHeightUse = true
        XCTAssertEqual(formatter.isForPersonHeightUse, SULengthFormatter.shared.isForPersonHeightUse)
    }
}
