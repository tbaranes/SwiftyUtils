//
//  CGPointExtensionTEsts.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 09/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class CGPointExtensionTests: XCTestCase {

    func testOperators() {
        var point = CGPoint(x: 10, y: 10)
        let point2 = CGPoint(x: 10, y: 10)
        XCTAssertEqual(CGPoint(x: 20, y: 20), point + point2)
        XCTAssertEqual(CGPoint(x: 0, y: 0), point - point2)
        XCTAssertEqual(CGPoint(x: 20, y: 20), point * 2)

        point += point2
        XCTAssertEqual(CGPoint(x: 20, y: 20), point)

        point -= point2
        XCTAssertEqual(CGPoint(x: 10, y: 10), point)

        point *= 2
        XCTAssertEqual(CGPoint(x: 20, y: 20), point)
    }

}
