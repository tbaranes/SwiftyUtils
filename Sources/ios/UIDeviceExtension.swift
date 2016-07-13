// UIDeviceExtension.swift
//
// Copyright (c) 2016 Tom Baranes
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

public extension UIDevice {

    public class func idForVendor() -> String? {
        return UIDevice.current().identifierForVendor?.uuidString
    }

    public class func systemName() -> String {
        return UIDevice.current().systemName
    }

    public class func systemVersion() -> String {
        return UIDevice.current().systemVersion
    }

    public class func systemFloatVersion() -> Float {
        return (systemVersion() as NSString).floatValue
    }

    public class func deviceName() -> String {
        return UIDevice.current().name
    }

    public class func deviceLanguage() -> String {
        return Bundle.main.preferredLocalizations[0]
    }

    public class func isPhone() -> Bool {
        return UIDevice.current().userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    public class func isPad() -> Bool {
        return UIDevice.current().userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }

    public class func deviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)

        let machine = systemInfo.machine
        var identifier = ""
        let mirror = Mirror(reflecting: machine)

        for child in mirror.children {
            let value = child.value

            if let value = value as? Int8 where value != 0 {
                identifier.append(UnicodeScalar(UInt8(value)))
            }
        }

        return identifier
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
        UIDevice.current().forceRotation(orientation)
    }

}
