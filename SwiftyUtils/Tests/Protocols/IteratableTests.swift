//
//  Created by Tom Baranes on 15/09/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

public enum Alphabet: Iteratable {
    case a, b, c, d
}


final class IteratableTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Tests

extension IteratableTests {

    func testIterateEnum() {
        let values = iterateEnum(Alphabet.self).map { $0 }
        XCTAssertEqual(values.count, 4)
        XCTAssertEqual(values[0], Alphabet.a)
        XCTAssertEqual(values[1], Alphabet.b)
        XCTAssertEqual(values[2], Alphabet.c)
        XCTAssertEqual(values[3], Alphabet.d)
    }

}
