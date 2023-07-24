//
//  UIImageExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 13/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

#if os(iOS)
import XCTest

// MARK: Life cycle

final class UIImageExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Colors

extension UIImageExtensionTests {

    func testRenderingModeOriginal() {
        let image = UIImage(color: .green).original
        XCTAssertEqual(image.original, image.withRenderingMode(.alwaysOriginal))
    }

    func testRenderingModeTemplate() {
        let image = UIImage(color: .green).template
        XCTAssertEqual(image.template, image.withRenderingMode(.alwaysTemplate))
    }

}
#endif
