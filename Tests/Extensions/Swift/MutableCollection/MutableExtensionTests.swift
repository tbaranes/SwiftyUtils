//
//  MutableExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 14/06/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class MutableExtensionTests: XCTestCase {

    // MARK: - Life cycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - KeyPath

extension MutableExtensionTests {

    private struct Author: Equatable {
        let name: String
    }

    func testSortedKeyPath_defaultOrder() {
        let romain = Author(name: "Romain")
        let enrique = Author(name: "Enrique")
        let amelie = Author(name: "Amelie")
        var songs = [amelie, romain, enrique]
        songs.sort(by: \.name)
        XCTAssertEqual(songs, [amelie, enrique, romain])
    }

    func testSortedKeyPath_ascendingOrder() {
        let romain = Author(name: "Romain")
        let enrique = Author(name: "Enrique")
        let amelie = Author(name: "Amelie")
        var songs = [amelie, romain, enrique]
        songs.sort(by: \.name, order: <)
        XCTAssertEqual(songs, [amelie, enrique, romain])
    }

    func testSortedKeyPath_descendingOrder() {
        let romain = Author(name: "Romain")
        let enrique = Author(name: "Enrique")
        let amelie = Author(name: "Amelie")
        var songs = [amelie, romain, enrique]
        songs.sort(by: \.name, order: >)
        XCTAssertEqual(songs, [romain, enrique, amelie])
    }
}
