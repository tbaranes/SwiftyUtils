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
#if os(OSX)
    import Cocoa
#else
    import UIKit
#endif

// MARK: Create Colors

public extension SwiftyColor {

    public convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }

    public convenience init(hex: String, alpha: Float) {
        let hex = hex.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
        var int = UInt32()
        NSScanner(string: hex).scanHexInt(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
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
