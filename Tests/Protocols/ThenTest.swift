//
//  Created by Tom Baranes on 03/06/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

struct User {
    var name: String?
    var email: String?
}
extension User: Then {}

final class ThenTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

extension ThenTests {

    func testThen_object() {
        let queue = OperationQueue().then {
            $0.name = "awesome"
            $0.maxConcurrentOperationCount = 5
        }
        XCTAssertEqual(queue.name, "awesome")
        XCTAssertEqual(queue.maxConcurrentOperationCount, 5)
    }

    func testThen_value() {
        let user = User().then {
            $0.name = "SwiftyUtils"
            $0.email = "SwiftyUtils@gmail.com"
        }
        XCTAssertEqual(user.name, "SwiftyUtils")
        XCTAssertEqual(user.email, "SwiftyUtils@gmail.com")
    }

}
