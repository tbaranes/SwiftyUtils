//
//  Created by Tom Baranes on 23/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class DoubleExtensionTests: XCTestCase {

    var value: Double = 1

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Time Transform

extension DoubleExtensionTests {

    func testMilliseconds() {
        XCTAssertEqual(1.3.milliseconds, 0.0013)
    }

    func testSeconds() {
        XCTAssertEqual(1.second, 1.0)
        XCTAssertEqual(1.2.seconds, 1.2)
    }

    func testMinutes() {
        XCTAssertEqual(1.minute, 60.0)
        XCTAssertEqual(1.5.minutes, 90.0)
    }

    func testHours() {
        XCTAssertEqual(1.hour, 1.minute * 60)
        XCTAssertEqual(1.5.hours, 5400.0)
    }

    func testDays() {
        XCTAssertEqual(0.5.day, 43_200 )
        XCTAssertEqual(1.day, 86_400 )
        XCTAssertEqual(2.days, 172_800)
    }

}

// MARK: - Transform

extension DoubleExtensionTests {

    func testFormattedPrice() {
        let price = 10.23
        if let symbol = Locale.current.currencySymbol {
            XCTAssert(price.formattedPrice.contains(symbol))
        }

        let formatter = SUNumberFormatter.shared
        formatter.locale = Locale.current
        XCTAssert(price.formattedPrice.contains(formatter.string(from: price as NSNumber)!))
    }

}
