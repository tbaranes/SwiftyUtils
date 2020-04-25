//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Device information

extension UIDevice {

    /// Generate a random uuid string.
    public class var idForVendor: String? {
        UIDevice.current.identifierForVendor?.uuidString
    }

    /// Returns the systeme name.
    public class func systemName() -> String {
        UIDevice.current.systemName
    }

    /// Returns the systeme version.
    @objc
    public class func systemVersion() -> String {
        UIDevice.current.systemVersion
    }

    /// Returns the device name.
    public class var deviceName: String {
        UIDevice.current.name
    }

    /// Returns the device language.
    public class var deviceLanguage: String {
        Bundle.main.preferredLocalizations[0]
    }

    /// Check if the device is either a Phone or not.
    @objc public class var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    /// Check if the device is either a Pad or not.
    @objc public class var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }

}

// MARK: - Version

extension UIDevice {

    /// Check if the version is equal to a specified one.
    /// - Parameter version: The version to compare with.
    /// - Returns: true if the version is equal to the specified one, otherwise false.
    public class func isVersion(_ version: Float) -> Bool {
        systemFloatVersion >= version && systemFloatVersion < (version + 1.0)
    }

    /// Check if the version is equal or later to a specified one.
    /// - Parameter version: The version to compare with.
    /// - Returns: true if the version is equal or superior to the specified one, otherwise false.
    public class func isVersionOrLater(_ version: Float) -> Bool {
        systemFloatVersion >= version
    }

    /// Check if the version is equal or earlier to a specified one.
    /// - Parameter version: The version to compare with.
    /// - Returns: true if the version is equal or inferior to the specified one, otherwise false.
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

    /// Force the device rotation.
    /// - Parameter orientation: The orientation that the device will be forced to.
    public class func forceRotation(_ orientation: UIInterfaceOrientation) {
        UIDevice.current.forceRotation(orientation)
    }

    /// Force the device rotation.
    /// - Parameter orientation: The orientation that the device will be forced to.
    public func forceRotation(_ orientation: UIInterfaceOrientation) {
        setValue(orientation.rawValue, forKey: "orientation")
    }

}
#endif

#endif
