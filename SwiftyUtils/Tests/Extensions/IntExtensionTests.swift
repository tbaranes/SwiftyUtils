//
//  Created by Tom Baranes on 23/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

final class IntExtensionTests: XCTestCase {

    // MARK - Life cycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK -

extension IntExtensionTests {

    func testDigits() {
        XCTAssertEqual(33.digits, 2)
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

}

// MARK - Round

extension IntExtensionTests {

    func testNearest() {
        var value = 17578
        XCTAssertEqual(value.nearestDozens, 17580)
        XCTAssertEqual(value.nearestHundreds, 17600)
        XCTAssertEqual(value.nearestThousands, 18000)

        value = 17442
        XCTAssertEqual(value.nearestDozens, 17440)
        XCTAssertEqual(value.nearestHundreds, 17400)
        XCTAssertEqual(value.nearestThousands, 17000)
    }

}

// MARK - Round below

extension IntExtensionTests {

    func testNearestBelow() {
        var value = 17578
        XCTAssertEqual(value.nearestBelowDozens, 17570)
        XCTAssertEqual(value.nearestBelowHundreds, 17500)
        XCTAssertEqual(value.nearestBelowThousands, 17000)

        value = 17442
        XCTAssertEqual(value.nearestBelowDozens, 17440)
        XCTAssertEqual(value.nearestBelowHundreds, 17400)
        XCTAssertEqual(value.nearestBelowThousands, 17000)
    }
    
}

// MARK - Round Up

extension IntExtensionTests {

    func testNearestUp() {
        var value = 17578
        XCTAssertEqual(value.nearestUpDozens, 17580)
        XCTAssertEqual(value.nearestUpHundreds, 17600)
        XCTAssertEqual(value.nearestUpThousands, 18000)

        value = 17442
        XCTAssertEqual(value.nearestUpDozens, 17450)
        XCTAssertEqual(value.nearestUpHundreds, 17500)
        XCTAssertEqual(value.nearestUpThousands, 18000)
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
