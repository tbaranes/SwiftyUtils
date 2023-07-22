//
//  NibOwnerLoadableTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class NibOwnerLoadableTests: XCTestCase {

    // MARK: Life cycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Tests

#if os(iOS)
extension NibOwnerLoadableTests {

    func testLoadNib() {
        let view = NibLoadableView.loadFromNib()
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.nibOwnerLoadableView)
        XCTAssertNotNil(view.nibOwnerLoadableView.label)
    }

}
#endif
