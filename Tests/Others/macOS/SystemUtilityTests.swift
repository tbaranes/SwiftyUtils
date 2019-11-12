//
//  Created by Tom Baranes on 14/07/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(macOS)
import XCTest
import SwiftyUtils

final class SystemUtilityTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Test System Shell Utility

extension SystemUtilityTests {

    func testShell() {
        let randomStr = "asdgasdfjlasdklgakjsdhf"
        let shellPath = SystemUtility.shell(["echo", randomStr])

        XCTAssertTrue(shellPath.returnCode == 0)
        XCTAssertTrue(shellPath.stdOut.trimmed() == randomStr)
    }

    func testShellArray() {
        let shellLS = SystemUtility.shellArrayOut(["ls", "-l", "/"])

        XCTAssertTrue(shellLS.returnCode == 0)
        XCTAssertTrue(shellLS.stdOut[0].contains("total", compareOption: .caseInsensitive))
    }
}

#endif
