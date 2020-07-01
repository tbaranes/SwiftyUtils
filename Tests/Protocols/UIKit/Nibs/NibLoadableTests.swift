//
//  NibLoadable.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class NibLoadableTests: XCTestCase {

    // MARK: Life cycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Tests

extension NibLoadableTests {

    func testLoadNib() {
        let view = NibLoadableView.loadFromNib()
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.label)
    }

}
