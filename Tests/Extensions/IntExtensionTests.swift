//
//  Created by Tom Baranes on 23/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class IntExtensionTests: XCTestCase {

    // MARK: - Life cycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Tests

extension IntExtensionTests {

    func testDigits() {
        XCTAssertEqual(33.digits, 2)
        XCTAssertEqual(0.digits, 1)
    }

    func testEvenAndOdd() {
        XCTAssertFalse(33.isEven)
        XCTAssertTrue(34.isEven)
        XCTAssertTrue(33.isOdd)
        XCTAssertFalse(34.isOdd)
    }

    func testPositiveVsNegative() {
        XCTAssertTrue(33.isPositive)
        XCTAssertFalse((-33).isPositive)
        XCTAssertFalse(33.isNegative)
        XCTAssertTrue((-33).isNegative)
    }

    func testRange() {
        XCTAssertEqual(33.range, 0..<33)
    }

}

// MARK: - Round

extension IntExtensionTests {

    func testNearest() {
        var value = 17_578
        XCTAssertEqual(value.nearestDozens, 17_580)
        XCTAssertEqual(value.nearestHundreds, 17_600)
        XCTAssertEqual(value.nearestThousands, 18_000)

        value = 17_442
        XCTAssertEqual(value.nearestDozens, 17_440)
        XCTAssertEqual(value.nearestHundreds, 17_400)
        XCTAssertEqual(value.nearestThousands, 17_000)
    }

}

// MARK: - Round below

extension IntExtensionTests {

    func testNearestBelow() {
        var value = 17_578
        XCTAssertEqual(value.nearestBelowDozens, 17_570)
        XCTAssertEqual(value.nearestBelowHundreds, 17_500)
        XCTAssertEqual(value.nearestBelowThousands, 17_000)

        value = 17_442
        XCTAssertEqual(value.nearestBelowDozens, 17_440)
        XCTAssertEqual(value.nearestBelowHundreds, 17_400)
        XCTAssertEqual(value.nearestBelowThousands, 17_000)
    }

}

// MARK: - Round Up

extension IntExtensionTests {

    func testNearestUp() {
        var value = 17_578
        XCTAssertEqual(value.nearestUpDozens, 17_580)
        XCTAssertEqual(value.nearestUpHundreds, 17_600)
        XCTAssertEqual(value.nearestUpThousands, 18_000)

        value = 17_442
        XCTAssertEqual(value.nearestUpDozens, 17_450)
        XCTAssertEqual(value.nearestUpHundreds, 17_500)
        XCTAssertEqual(value.nearestUpThousands, 18_000)
    }

}

// MARK: - Transform

extension IntExtensionTests {

    func testFormattedPrice() {
        let price = 10
        if let symbol = Locale.current.currencySymbol {
            XCTAssert(price.formattedPrice.contains(symbol))
        }

        let formatter = SUNumberFormatter.shared
        formatter.locale = Locale.current
        XCTAssert(price.formattedPrice.contains(formatter.string(from: price as NSNumber)!))
    }

}
