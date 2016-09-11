//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class UserDefaultsExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK - Subscript

extension UserDefaultsExtensionTests {

    func testSubscript() {
        let defaults = UserDefaults.standard
        let username = "test"
        defaults["userName"] = username
        XCTAssertEqual(defaults["userName"] as? String ?? "", username)
    }
}

// MARK -

extension UserDefaultsExtensionTests {

    func testContainsKeySuccess() {
        let key = "aKey"
        let value = "aValue"
        UserDefaults.standard.set(value, forKey: key)
        XCTAssertTrue(UserDefaults.contains(key: key))
    }

    func testContainsKeyFailure() {
        let key = "aFakeKey"
        XCTAssertFalse(UserDefaults.contains(key: key))
    }

}
