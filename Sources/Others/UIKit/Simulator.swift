//
//  Created by Tom Baranes on 14/07/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public struct Simulator {

    public static var isRunning: Bool = {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }()

}
