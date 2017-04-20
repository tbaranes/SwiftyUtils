//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class UserDefaultsExtensionTests: XCTestCase {

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

// MARK - Misc

extension UserDefaultsExtensionTests {

    func testHasKey() {
        let key = "aKey"
        let value = "aValue"
        UserDefaults.standard.set(value, forKey: key)
        XCTAssertTrue(UserDefaults.has(key: key))
        XCTAssertFalse(UserDefaults.has(key: "fakeKey"))
    }

}

// MARK - Remove

extension UserDefaultsExtensionTests {

    func testRemoveAll() {
        func testRemoveAll() {
            let defaults = UserDefaults.standard
            defaults["a"] = "test1"
            defaults["b"] = "test2"
            let count = defaults.dictionaryRepresentation().count
            XCTAssert(!defaults.dictionaryRepresentation().isEmpty)
            defaults.removeAll()
            XCTAssert(!defaults.has(key: "a"))
            XCTAssert(!defaults.has(key: "b"))
            // We'll still have the system keys present, but our two keys should be gone
            XCTAssert(defaults.dictionaryRepresentation().count == count - 2)
        }
    }

}
