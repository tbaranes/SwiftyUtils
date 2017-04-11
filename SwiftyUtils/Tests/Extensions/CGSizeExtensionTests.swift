//
//  CGSizeExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 09/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class CGSizeExtensionTests: XCTestCase {

    func testOperators() {
        var size = CGSize(width: 10, height: 10)
        let size2 = CGSize(width: 10, height: 10)
        XCTAssertEqual(CGSize(width: 20, height: 20), size + size2)
        XCTAssertEqual(CGSize(width: 0, height: 0), size - size2)
        XCTAssertEqual(CGSize(width: 20, height: 20), size * 2)

        size += size2
        XCTAssertEqual(CGSize(width: 20, height: 20), size)

        size -= size2
        XCTAssertEqual(CGSize(width: 10, height: 10), size)

        size *= 2
        XCTAssertEqual(CGSize(width: 20, height: 20), size)
    }
    
}
