//
//  DictionaryExtensionTests.swift
//  SwiftyUtilsDemo
//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class DictionaryExtensionTests: XCTestCase {

    var firstdic: [String:Int]!
    var secondDic: [String:Int]!
    var thirdDic: [String:Int]!
    var fourthDic: [String:Int]!

    override func setUp() {
        super.setUp()
        firstdic = ["one" : 1, "two" : 2, "three" : 3]
        secondDic = ["four" : 4, "five" : 5]
        thirdDic = ["six" : 6, "seven" : 7]
        fourthDic = ["two" : 2, "three" : 3, "five" : 5, "six" : 6]
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK - Transform

extension DictionaryExtensionTests {

    func testUnion() {
        let union = firstdic.union(secondDic)
        XCTAssertEqual(firstdic.keys.count + secondDic.keys.count, union.keys.count)
        XCTAssertEqual(firstdic.values.count + secondDic.values.count, union.values.count)

        let multiUnion = firstdic | secondDic | thirdDic
        XCTAssertEqual(firstdic.keys.count + secondDic.keys.count + thirdDic.keys.count,
                       multiUnion.keys.count)
        XCTAssertEqual(firstdic.values.count + secondDic.values.count + thirdDic.values.count,
                       multiUnion.values.count)
    }

    func testMergeDictionaries() {
        var finalDic: Dictionary<String, Int> = [:]
        finalDic.merge(firstdic, secondDic)
        XCTAssertEqual(finalDic.count, firstdic.count + secondDic.count)
        for (key, _) in firstdic {
            XCTAssertEqual(finalDic[key], firstdic[key])
        }
        for (key, _) in secondDic {
            XCTAssertEqual(finalDic[key], secondDic[key])
        }
    }

}

// MARK: - Helpers

extension DictionaryExtensionTests {

    func testHas() {
        XCTAssertTrue(firstdic.has("one"))
    }

    func testTestAll() {
        let allKeysHaveMoreThan3Chars = firstdic.testAll { key, _ in key.length >= 3 }
        XCTAssertTrue(allKeysHaveMoreThan3Chars)
    }

    func testDifference() {
        let union = firstdic | secondDic
        let difference = union - fourthDic

        XCTAssertTrue(difference.has("one"))
        XCTAssertTrue(difference.has("four"))
        XCTAssertEqual(difference.count, 2)
    }

}
