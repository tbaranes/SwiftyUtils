//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

public extension UIDevice {

    public class func idForVendor() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }

    public class func systemName() -> String {
        return UIDevice.current.systemName
    }

    public class func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }

    public class func systemFloatVersion() -> Float {
        return (systemVersion() as NSString).floatValue
    }

    public class func deviceName() -> String {
        return UIDevice.current.name
    }

    public class func deviceLanguage() -> String {
        return Bundle.main.preferredLocalizations[0]
    }

    public class func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    public class func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }

}

// MARK: - Version

public extension UIDevice {

    public class func isVersion(_ version: Float) -> Bool {
        return systemFloatVersion() >= version && systemFloatVersion() < (version + 1.0)
    }

    public class func isVersionOrLater(_ version: Float) -> Bool {
        return systemFloatVersion() >= version
    }

    public class func isVersionOrEarlier(_ version: Float) -> Bool {
        return systemFloatVersion() < (version + 1.0)
    }

}

public extension UIDevice {

    public func forceRotation(_ orientation: UIInterfaceOrientation) {
        setValue(orientation.rawValue, forKey: "orientation")
    }

    public class func forceRotation(_ orientation: UIInterfaceOrientation) {
        UIDevice.current.forceRotation(orientation)
    }

}
