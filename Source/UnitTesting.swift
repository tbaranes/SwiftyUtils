//
//  Created by Tom Baranes on 14/07/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public struct UnitTesting {

    public static var isRunning: Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }

    #if !os(watchOS)
    public static func measure(closure: () -> Void) -> Float {
        let start = CACurrentMediaTime()
        closure()

        let end = CACurrentMediaTime()
        return Float(end - start)
    }
    #endif
}
