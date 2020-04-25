//
//  UIButtonExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import UIKit

final class UIButtonExtensionTests: XCTestCase {

}

// MARK: - Tests

extension UIButtonExtensionTests {

    func testAddRightImageWithOffset() {
        let button = UIButton(frame: .zero)
        button.setTitle("This is a test", for: .normal)

        let image = UIImage(color: .blue)
        button.addRightImage(image, offset: 16)
        XCTAssertEqual(button.imageView?.image, image)
    }

}
