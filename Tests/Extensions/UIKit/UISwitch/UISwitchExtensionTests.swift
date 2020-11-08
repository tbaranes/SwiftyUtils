//
//  UISwitchExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 11/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest

#if os(iOS)
// MARK: Life cycle

final class UISwitchExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Misc

extension UISwitchExtensionTests {

    func testToggle() {
        let aSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        XCTAssertFalse(aSwitch.isOn)
        aSwitch.toggle(animated: false)
        XCTAssert(aSwitch.isOn)
    }

}
#endif
