//
//  Created by Tom Baranes on 14/07/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public enum UITesting {

    /// Check if interface tests are running or not.
    public static var isRunning: Bool {
        ProcessInfo.processInfo.arguments.contains("-ui_testing")
    }

}
