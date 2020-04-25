//
//  BundleExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class BundleExtensionTests: XCTestCase {

}

// MARK: - App Information

extension BundleExtensionTests {

    func testAppName() {
        XCTAssertEqual(Bundle.main.appName, "xctest")
    }

    func testDisplayName() {
        XCTAssertEqual(Bundle.main.displayName, "")
    }

    func testAppVersion() {
        XCTAssertEqual(Bundle.main.appVersion, "")
    }

    func testBundleId() {
        XCTAssertEqual(Bundle.main.bundleId, "com.apple.dt.xctest.tool")
    }

}

// MARK: - Status

extension BundleExtensionTests {

    func testIsInTestFlight() {
        XCTAssertFalse(Bundle.main.isInTestFlight)
    }

}

// MARK: - Schemes

extension BundleExtensionTests {

    func testSchemes() {
        XCTAssertEqual(Bundle.main.schemes, [])
    }

    func testMainSchemes() {
        XCTAssertNil(Bundle.main.mainScheme)
    }

}
