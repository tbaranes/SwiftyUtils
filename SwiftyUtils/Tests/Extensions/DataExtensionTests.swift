//
//  Created by Tom Baranes on 23/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class DataExtensionTests: XCTestCase {
    let testString = "base 10 is so basic. base 16 is where it's at, yo."

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}


extension DataExtensionTests {

    func testToHexString() {
        guard let data = testString.data(using: .utf8) else {XCTFail("Couldn't make data out of provided string"); return}
        var hex = data.toHexString(spaces: true)
        XCTAssertTrue(hex == "62617365 20313020 69732073 6F206261 7369632E 20626173 65203136 20697320 77686572 65206974 27732061 742C2079 6F2E", "'\(hex)' == '62617365 20313020 69732073 6F206261 7369632E 20626173 65203136 20697320 77686572 65206974 27732061 742C2079 6F2E'")

        hex = data.toHexString(hexLeader: true)
        XCTAssertTrue(hex == "0x6261736520313020697320736F2062617369632E206261736520313620697320776865726520697427732061742C20796F2E")

        hex = data.toHexString()
        XCTAssertTrue(hex == "6261736520313020697320736F2062617369632E206261736520313620697320776865726520697427732061742C20796F2E")

    }

    func testHexToData() {
        var hexString = "6261736520313020697320736F2062617369632E206261736520313620697320776865726520697427732061742C20796F2E"
        do { // adding scope level so we can reuse variable names
            guard let data = Data(hexString: hexString) else {XCTFail("Couldn't make data out of provided string"); return}
            guard let string = String(data: data, encoding: .utf8) else {XCTFail("Couldn't make string out of data"); return}

            XCTAssertTrue(testString == string, "\(testString) == \(string)")
        }

        hexString = "62617365 20313020 69732073 6F206261 7369632E 20626173 65203136 20697320 77686572 65206974 27732061 742C2079 6F2E"
        do { // adding scope level so we can reuse variable names
            guard let data = Data(hexString: hexString) else {XCTFail("Couldn't make data out of provided string"); return}
            guard let string = String(data: data, encoding: .utf8) else {XCTFail("Couldn't make string out of data"); return}

            XCTAssertTrue(testString == string, "\(testString) == \(string)")
        }

        hexString = "0x6261736520313020697320736F2062617369632E206261736520313620697320776865726520697427732061742C20796F2E"
        do { // adding scope level so we can reuse variable names
            guard let data = Data(hexString: hexString) else {XCTFail("Couldn't make data out of provided string"); return}
            guard let string = String(data: data, encoding: .utf8) else {XCTFail("Couldn't make string out of data"); return}

            XCTAssertTrue(testString == string, "\(testString) == \(string)")
        }

        var badHexString = "agasfdlikasdgd" //illegal characters - letters
        do { // adding scope level so we can reuse variable names
            XCTAssertNil(Data(hexString: badHexString))
        }

        badHexString = "deadbe;fcaf$" //illegal characters - symbols
        do { // adding scope level so we can reuse variable names
            XCTAssertNil(Data(hexString: badHexString))
        }

        badHexString = "deadbeefcafee" //odd # of characters
        do { // adding scope level so we can reuse variable names
            XCTAssertNil(Data(hexString: badHexString))
        }
    }

}
