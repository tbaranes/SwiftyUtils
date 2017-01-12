//
//  CGRectExtensionTest.swift
//  SwiftyUtils
//
//  Created by Mulang Su on 12/01/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

class CGRectExtensionTest: XCTestCase {
    
    func testXYWHChanges() {
        let rect = CGRect(x: 1, y: 2, width: 3, height: 4)
        XCTAssertEqual(rect.x, 1)
        XCTAssertEqual(rect.y, 2)
        
        let newRect1 = rect.with(x: 10)
        let newRect2 = rect.with(y: 10)
        let newRect3 = rect.with(width: 10)
        let newRect4 = rect.with(height: 10)
        XCTAssertEqual(newRect1.x, 10)
        XCTAssertEqual(newRect2.y, 10)
        XCTAssertEqual(newRect3.width, 10)
        XCTAssertEqual(newRect4.height, 10)
        
        let newRect5 = rect.with(origin: CGPoint.zero)
        XCTAssertEqual(newRect5.origin, CGPoint.zero)
        
        let newRect6 = rect.with(size: CGSize(width: 10, height: 10))
        XCTAssertEqual(newRect6.size, CGSize(width: 10, height: 10))
    }
    
}
