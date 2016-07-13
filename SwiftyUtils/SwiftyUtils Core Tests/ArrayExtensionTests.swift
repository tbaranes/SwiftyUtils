//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class ArrayExtensionTests: XCTestCase {

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

// MARK - Delete

extension ArrayExtensionTests {

    func testRemoveObject() {
        var arrayToTest = [1, 2, 3]
        var isObjectRemoved = arrayToTest.remove(object: 2)
        XCTAssertTrue(isObjectRemoved)
        isObjectRemoved = arrayToTest.remove(object: 5)
        XCTAssertFalse(isObjectRemoved)
    }

    func testRemoveObjects() {
        let copyArray = array
        array.remove(objects: 12345)
        XCTAssertEqual(array, copyArray)

        let compareArray = [0, 2, 3, 4, 5]
        array.remove(objects: 1)
        XCTAssertEqual(array, compareArray)
    }

}

// MARK: - Getter

extension ArrayExtensionTests {

    func testRandom() {
        XCTAssertNotNil(array.random())
        XCTAssertNil([].random())
    }

    func testGet() {
        XCTAssertNotNil(array.get(index: 1))
        XCTAssertNil(array.get(index: 10))
    }

    func testTakeMax() {
        XCTAssertEqual(array.takeMax(n: 2).count, 2)
    }

    func testIndexesOf() {
        var indexes = array.indexes(of: 1)
        XCTAssertEqual(indexes, [1, 6])

        indexes = array.indexes(of: 12345)
        XCTAssertEqual(indexes, [])
    }

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

}

// MARK: - Update

extension ArrayExtensionTests {

    func testReverseIndex() {
        let array = [Int](0...5)
        XCTAssertEqual(array.reverse(index: 0), 5)
        XCTAssertEqual(array.reverse(index: 2), 3)
    }

}

// MARK: - Helpers

extension ArrayExtensionTests {

    func testContainsInstanceOf() {
        XCTAssertFalse(array.contains(instanceOf: "a"))
        XCTAssertFalse(array.contains(instanceOf: 12.22))
        XCTAssertTrue(array.contains(instanceOf: 46378))
    }

    func testTestAll() {
        XCTAssertTrue(array.testAll { $0 < 10 })
    }

    func testContains() {
        let array = [Int](2...4)
        XCTAssertTrue(array.contains(items: 2, 3, 4))
    }

    func testContainsArray() {
        let array = [Int](2...4)
        XCTAssertTrue(self.array.contains(array: array))
    }

}
