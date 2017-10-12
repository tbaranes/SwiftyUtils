//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

// MARK: - Device information

extension UIDevice {

    public class var idForVendor: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }

    public class func systemName() -> String {
        return UIDevice.current.systemName
    }

    @objc
    public class func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }

    public class var deviceName: String {
        return UIDevice.current.name
    }

    public class var deviceLanguage: String {
        return Bundle.main.preferredLocalizations[0]
    }

    @objc public class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    @objc public class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }

}

// MARK: - Version

extension UIDevice {

    public class func isVersion(_ version: Float) -> Bool {
        return systemFloatVersion >= version && systemFloatVersion < (version + 1.0)
    }

    public class func isVersionOrLater(_ version: Float) -> Bool {
        return systemFloatVersion >= version
    }

    public class func isVersionOrEarlier(_ version: Float) -> Bool {
        return systemFloatVersion < (version + 1.0)
    }

    private class var systemFloatVersion: Float {
        return (systemVersion() as NSString).floatValue
    }

}

// MARK: - Rotation

#if os(iOS)
extension UIDevice {

    public class func forceRotation(_ orientation: UIInterfaceOrientation) {
        UIDevice.current.forceRotation(orientation)
    }

    public func forceRotation(_ orientation: UIInterfaceOrientation) {
        setValue(orientation.rawValue, forKey: "orientation")
    }

}
#endif
