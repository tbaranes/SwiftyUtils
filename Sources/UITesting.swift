//
//  Created by Tom Baranes on 14/07/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public struct UITesting {

    public static var isRunning: Bool {
        return ProcessInfo.processInfo.arguments.contains("-ui_testing")
    }
}
