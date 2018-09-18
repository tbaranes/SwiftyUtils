//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class ArrayExtensionTests: XCTestCase {

    var array = [Int]()

    override func setUp() {
        super.setUp()
        array = [Int](0...5)
        array.append(1)
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK - Subscript

extension ArrayExtensionTests {

    func testSafeSubscript() {
        let arrayToTest = [1, 2, 3]
        XCTAssertEqual(2, arrayToTest[safe: 1])
        XCTAssertNil(arrayToTest[safe: 10])
    }

}

// MARK - Remove

extension ArrayExtensionTests {

    func testRemoveDuplicates() {
        var array = [0, 0, 1, 1, 2]
        let expectedArray = [0, 1, 2]
        array.removeDuplicates()
        XCTAssertEqual(array, expectedArray)
    }

    func testRemovedDuplicates() {
        let array = [0, 0, 1, 1, 2]
        let expectedArray = [0, 1, 2]
        XCTAssertEqual(array.removedDuplicates(), expectedArray)
    }

}

// MARK: - Index Getter

extension ArrayExtensionTests {

    func testIndexesOf() {
        var indexes = array.indexes(of: 1)
        XCTAssertEqual(indexes, [1, 6])

        indexes = array.indexes(of: 12345)
        XCTAssertEqual(indexes, [])
    }

    func testFirstIndexOf() {
        var index = array.firstIndex(of: 1)
        XCTAssertEqual(index!, 1)

        index = array.firstIndex(of: 12345)
        XCTAssertNil(index)
    }

    func testLastIndexOf() {
        var index = array.firstIndex(of: 1)
        XCTAssertEqual(index!, 1)

        index = array.firstIndex(of: 12345)
        XCTAssertNil(index)
    }

}

// MARK: - Transform

extension ArrayExtensionTests {

    func testDifference() {
        let a = [Int](0...8), b = [Int](3...4), c = [Int](1...2)
        let difference = a.difference(with: b, c)
        XCTAssertEqual(difference, [0, 5, 6, 7, 8])
    }

    func testIntersection() {
        let a = [Int](0...8), b = [Int](3...4), c = [Int](1...6)
        let intersection = a.intersection(for: b, c)
        XCTAssertEqual(intersection, [3, 4])
    }

    func testUnion() {
        let a = [Int](0...2), b = [Int](3...5), c = [Int](6...8)
        let union = a.union(values: b, c)
        XCTAssertEqual(union, [Int](0...8))
    }

    func testSplitIntoChunksOf() {
        let array = [0, 1, 2, 3]
        let split = array.split(intoChunksOf: 2)
        XCTAssertEqual(split.count, 2)
        XCTAssertEqual(split[0][0], 0)
        XCTAssertEqual(split[0][1], 1)
        XCTAssertEqual(split[1][0], 2)
        XCTAssertEqual(split[1][1], 3)
    }

}
