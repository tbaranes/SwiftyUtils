//
//  NSFileManagerTests.swift
//  Demo
//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class NSFileManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
}

// MARK: - Create

extension NSFileManagerTests {
    
    func testCreateDirectory() {
        let directoryURL = NSFileManager.defaultManager().documentDirectory()
        directoryURL.URLByAppendingPathComponent("demo", isDirectory: true)
        do {
            try NSFileManager.defaultManager().createDirectory(at: directoryURL)
            XCTAssertTrue(NSFileManager.defaultManager().fileExistsAtPath(directoryURL.path ?? ""))
        } catch {
            XCTAssertTrue(false)
        }
    }
    
}
