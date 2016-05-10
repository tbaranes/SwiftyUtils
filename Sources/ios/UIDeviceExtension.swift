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
        return UIDevice.currentDevice().identifierForVendor?.UUIDString
    }
    
    public class func appVersion() -> String {
        return String(NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString"))
    }
    
    public class func systemName() -> String {
        return UIDevice.currentDevice().systemName
    }
    
    public class func systemVersion() -> String {
        return UIDevice.currentDevice().systemVersion
    }
    
    public class func systemFloatVersion() -> Float {
        return (systemVersion() as NSString).floatValue
    }
    
    public class func deviceName() -> String {
        return UIDevice.currentDevice().name
    }
    
    public class func deviceLanguage() -> String {
        return NSBundle.mainBundle().preferredLocalizations[0]
    }
    
    public class func isPhone() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone
    }
    
    public class func isPad() -> Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad
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
    
    public class func isVersion(version: Float) -> Bool {
        return systemFloatVersion() >= version && systemFloatVersion() < (version + 1.0)
    }
    
    public class func isVersionOrLater(version: Float) -> Bool {
        return systemFloatVersion() >= version
    }
    
    public class func isVersionOrEarlier(version: Float) -> Bool {
        return systemFloatVersion() < (version + 1.0)
    }
    
}
