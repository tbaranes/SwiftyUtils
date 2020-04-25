//
//  UserDefaultsBackedTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import Foundation
import XCTest
import SwiftyUtils

final class UserDefaultsBackedTests: XCTestCase {

    // MARK: Properties

    // swiftlint:disable let_var_whitespace
    @UserDefaultsBacked(key: "search-page-size", defaultValue: 20)
    private var numberOfSearchResultsPerPage: Int

    @UserDefaultsBacked(key: "signature")
    private var messageSignature: String?
    // swiftlint:enable let_var_whitespace

    // MARK: Life Cycle

    override func setUp() {
        super.setUp()
        UserDefaults.standard.removeAll()
    }

    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeAll()
    }

}

// MARK: - Tests

extension UserDefaultsBackedTests {

    func testGet_withDefaultValue() {
        XCTAssertEqual(numberOfSearchResultsPerPage, 20)
    }

    func testUpdate_withDefaultValue() {
        numberOfSearchResultsPerPage = 30
        XCTAssertEqual(numberOfSearchResultsPerPage, 30)
    }

    func testRemoving_withDefaultValue() {
        UserDefaults.standard.removeObject(forKey: "search-page-size")
        XCTAssertEqual(numberOfSearchResultsPerPage, 20)
    }

    func testGet_withoutDefaultValue() {
        XCTAssertNil(messageSignature)
    }

    func testUpdate_withoutDefaultValue() {
        messageSignature = "signature"
        XCTAssertEqual(messageSignature, "signature")
    }

    func testRemove_withoutDefaultValue() {
        messageSignature = "signature"
        XCTAssertEqual(messageSignature, "signature")
        messageSignature = nil
        XCTAssertNil(messageSignature)
    }

}
