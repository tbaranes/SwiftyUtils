//
//  NSLayoutConstraintExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

class NSLayoutConstraintExtensionTests: XCTestCase {

    var view: UIView!
    var superview: UIView!

    override func setUp() {
        super.setUp()
        view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
    }
    
    override func tearDown() {
        super.tearDown()
    }

}

extension NSLayoutConstraintExtensionTests {
    
    func testApplyMultiplierWidth() {
        let constraint = NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1, constant: 10)
        constraint.applyMultiplier(0.5, toView: superview)
        XCTAssertEqual(constraint.constant, 50)
    }
    
    func testApplyMultiplierHeight() {
        let constraint = NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1, constant: 10)
        constraint.applyMultiplier(0.5, toView: superview)
        XCTAssertEqual(constraint.constant, 100)
    }
    
}