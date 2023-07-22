//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class NSObjectExtensionTests: XCTestCase {

    // MARK: Life cycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Misc

#if !os(watchOS)
extension NSObjectExtensionTests {

    func testClassName() {
        #if os(macOS)
            let vc = NSViewController()
            XCTAssertEqual(vc.className, "NSViewController")
        #else
            let vc = UIViewController()
            XCTAssertEqual(vc.className, "UIViewController")
            XCTAssertEqual(UIViewController.className, "UIViewController")
        #endif
    }
}
#endif
