//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class DictionaryExtensionTests: XCTestCase {

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

    func testMap() {
        let dic = ["a": 1, "b": 2, "c": 3]
        let result = dic.map {
            ($0.uppercased(), "\($1 * 2)")
        }
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result["A"], "2")
        XCTAssertEqual(result["B"], "4")
        XCTAssertEqual(result["C"], "6")
    }

    func testFlatMap() {
        let dic = ["a": 1, "b": 2, "c": 3]
        let result = dic.flatMap { key, value -> (String, String)? in
            value % 2 == 0 ? nil : (key.uppercased(), "\(value * 2)")
        }
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result["A"], "2")
        XCTAssertNil(result["B"])
        XCTAssertEqual(result["C"], "6")
    }

    func testUnion() {
        let union = firstdic.union(values: secondDic)
        XCTAssertEqual(firstdic.keys.count + secondDic.keys.count, union.keys.count)
        XCTAssertEqual(firstdic.values.count + secondDic.values.count, union.values.count)
    }

    func testMergeDictionaries() {
        var finalDic: Dictionary<String, Int> = [:]
        finalDic.merge(with: firstdic, secondDic)
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
        XCTAssertTrue(firstdic.has(key: "one"))
    }

    func testTestAll() {
        let allKeysHaveMoreThan3Chars = firstdic.testAll { key, _ in key.length >= 3 }
        XCTAssertTrue(allKeysHaveMoreThan3Chars)
    }

    func testDifference() {
        let union = firstdic.union(values: secondDic)
        let difference = union.difference(with: fourthDic)

        XCTAssertTrue(difference.has(key: "one"))
        XCTAssertTrue(difference.has(key: "four"))
        XCTAssertEqual(difference.count, 2)
    }

}
