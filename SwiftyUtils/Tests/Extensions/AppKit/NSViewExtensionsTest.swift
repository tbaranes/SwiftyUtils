//
//  NSViewExtensionsTest.swift
//  SwiftyUtils
//
//  Created by Mulang Su on 12/01/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest

final class NSViewExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

extension NSViewExtensionTests {

    func testXYWHChanges() {
        let view = NSView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.x = 10
        view.y = 20
        view.width = 30
        view.height = 40
        XCTAssertEqual(view.frame, CGRect(x: 10, y: 20, width: 30, height: 40))
    }
    
}
