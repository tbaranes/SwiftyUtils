//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Device information

extension UIDevice {

    public class var idForVendor: String? {
        UIDevice.current.identifierForVendor?.uuidString
    }

    public class func systemName() -> String {
        UIDevice.current.systemName
    }

    @objc
    public class func systemVersion() -> String {
        UIDevice.current.systemVersion
    }

    public class var deviceName: String {
        UIDevice.current.name
    }

    public class var deviceLanguage: String {
        Bundle.main.preferredLocalizations[0]
    }

    @objc public class var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    @objc public class var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }

}

// MARK: - Version

extension UIDevice {

    public class func isVersion(_ version: Float) -> Bool {
        systemFloatVersion >= version && systemFloatVersion < (version + 1.0)
    }

    public class func isVersionOrLater(_ version: Float) -> Bool {
        systemFloatVersion >= version
    }

    public class func isVersionOrEarlier(_ version: Float) -> Bool {
        systemFloatVersion < (version + 1.0)
    }

    private class var systemFloatVersion: Float {
        (systemVersion() as NSString).floatValue
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

#endif
