//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public extension Bundle {

    public var appName: String {
        return string(for: "CFBundleDisplayName")
    }

    public var appVersion: String {
        return string(for: "CFBundleShortVersionString")
    }

    public var appBuild: String {
        return string(for: "CFBundleVersion")
    }

    public var bundleId: String {
        return string(for: "CFBundleIdentifier")
    }

    public var schemes: [String] {
        guard let infoDictionary = Bundle.main.infoDictionary,
            let urlTypes = infoDictionary["CFBundleURLTypes"] as? [AnyObject],
            let urlType = urlTypes.first as? [String : AnyObject],
            let urlSchemes = urlType["CFBundleURLSchemes"] as? [String] else {
                return []
        }
        return urlSchemes
    }

    public var mainScheme: String? {
        return schemes.first
    }

}

fileprivate extension Bundle {

    func string(for key: String) -> String {
        guard let infoDictionary = Bundle.main.infoDictionary,
            let value = infoDictionary[key] as? String else {
                return ""
        }
        return value
    }

}
