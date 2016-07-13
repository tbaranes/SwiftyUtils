//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class FileManagerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

}

// MARK: - Create

extension FileManagerTests {

    func testCreateDirectory() {
        let directoryURL = FileManager.default.document()
        directoryURL.appendingPathComponent("demo", isDirectory: true)
        do {
            try FileManager.default.createDirectory(at: directoryURL)
            XCTAssertTrue(FileManager.default.fileExists(atPath: directoryURL.path ?? ""))
        } catch {
            XCTAssertTrue(false)
        }
    }

}
