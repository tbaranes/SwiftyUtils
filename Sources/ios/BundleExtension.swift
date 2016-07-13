//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public extension Bundle {

    public var appVersion: String? {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    public var appBuild: String? {
        return self.infoDictionary?["CFBundleVersion"] as? String
    }

}
