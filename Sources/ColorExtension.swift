// ColorExtension.swift
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

import Foundation
#if os(iOS) || os (tvOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

// MARK: Create Colors

public extension SwiftyColor {

    public convenience init?(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    
    public convenience init?(hexString: String, alpha: Float) {
        var formatted = hexString.stringByReplacingOccurrencesOfString("0x", withString: "")
        formatted = formatted.stringByReplacingOccurrencesOfString("#", withString: "")
        if let hex = Int(formatted, radix: 16) {
            let red = CGFloat(CGFloat((hex & 0xFF0000) >> 16)/255.0)
            let green = CGFloat(CGFloat((hex & 0x00FF00) >> 8)/255.0)
            let blue = CGFloat(CGFloat((hex & 0x0000FF) >> 0)/255.0)
            self.init(red: red, green: green, blue: blue, alpha: CGFloat(alpha))
        } else {
            return nil
        }
    }
    
}

// MARK: Get Colors

public extension SwiftyColor {
    
    public func lighter(amount : CGFloat = 0.25) -> SwiftyColor {
        return hueColorWithBrightnessAmount(1 + amount)
    }
    
    public func darker(amount : CGFloat = 0.25) -> SwiftyColor {
        return hueColorWithBrightnessAmount(1 - amount)
    }
    
    private func hueColorWithBrightnessAmount(amount: CGFloat) -> SwiftyColor {
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        
        #if os (iOS) || os (tvOS)
            if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return SwiftyColor(hue: hue,
                               saturation: saturation,
                               brightness: brightness * amount,
                               alpha: alpha)
            } else {
                return self
            }
        #else
            getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return SwiftyColor(hue: hue,
                               saturation: saturation,
                               brightness: brightness * amount,
                               alpha: alpha)
        #endif
        
    }
    
}
