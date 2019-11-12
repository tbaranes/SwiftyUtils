//
//  Created by Tom Baranes on 15/09/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class CGFloatLiteralTests: XCTestCase {

    func testCGFloatLiteral() {
        XCTAssertEqual(12.f, CGFloat(12))
        XCTAssertEqual(12.3.f, CGFloat(12.3))
    }

}
