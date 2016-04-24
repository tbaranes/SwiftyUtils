//
//  CollectionTypeTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class CollectionTypeTests: XCTest {

    func testShuffle() {
        var array = [1,2,3,4,5]
        let copyArray = array
        array.shuffle()
        
        XCTAssertNotNil(array)
        XCTAssertEqual(array.count, copyArray.count)
        
        for element in copyArray {
            if let i = array.indexOf(element) {
                array.removeAtIndex(i)
            }
        }
        XCTAssertEqual(array, [])
    }
    
}
