//
//  Created by Tom Baranes on 14/07/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif

public enum UnitTesting {

    /// Check if unit tests are running or not. If running `spm test` from the command line, prefix it with `SPM_TESTING=true`
    ///
    /// For example:
    /// ```
    /// SPM_TESTING=true spm test
    /// ```
    public static var isRunning: Bool {
        ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil ||
        ProcessInfo.processInfo.environment["SPM_TESTING"] != nil
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
