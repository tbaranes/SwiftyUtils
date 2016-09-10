//
//  Created by Tom Baranes on 14/07/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation
import QuartzCore

public struct UnitTesting {

    public static var isRunning: Bool {
        return ProcessInfo.processInfo.environment["XCInjectBundle"] != nil
    }

    public static func measure(closure: () -> Void) -> Float {
        let start = CACurrentMediaTime()
        closure()

        let end = CACurrentMediaTime()
        return Float(end - start)
    }
}
