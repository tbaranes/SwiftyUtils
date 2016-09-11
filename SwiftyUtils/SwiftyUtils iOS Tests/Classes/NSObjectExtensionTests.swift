//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class NSObjectExtensionTests: XCTestCase {

    // MARK - Life cycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }


    // MARK -

    func testClassName() {
        let vc = UIViewController()
        XCTAssertEqual(vc.className, "UIViewController")
        XCTAssertEqual(UIViewController.className, "UIViewController")
    }

}
