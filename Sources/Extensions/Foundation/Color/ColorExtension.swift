//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(macOS)
    import Cocoa
#else
    import UIKit
#endif

// MARK: Init

extension SwiftyColor {

    /// Initialize a Color from an hex String.
    /// - Parameter hex: the hex used to create the color.
    @objc
    public convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: NSCharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let alpha, red, green, blue: UInt32
        switch hex.count {
        case 3:
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(red) / 255,
                  green: CGFloat(green) / 255,
                  blue: CGFloat(blue) / 255,
                  alpha: CGFloat(alpha) / 255)
    }

}

// MARK: - Components

#if !os(OSX)
extension SwiftyColor {

    /// Extract the red component from the `Color`.
    /// - Returns: Int.
    public var redComponent: Int {
        var red: CGFloat = 0
        getRed(&red, green: nil, blue: nil, alpha: nil)
        return Int(red * 255)
    }

    /// Extract the green component from the `Color`.
    /// - Returns: Int.
    public var greenComponent: Int {
        var green: CGFloat = 0
        getRed(nil, green: &green, blue: nil, alpha: nil)
        return Int(green * 255)
    }

    /// Extract the blue component from the `Color`.
    /// - Returns: Int.
    public var blueComponent: Int {
        var blue: CGFloat = 0
        getRed(nil, green: nil, blue: &blue, alpha: nil)
        return Int(blue * 255)
    }

    /// Extract the alpha component from the `Color`.
    /// - Returns: Int.
    public var alpha: CGFloat {
        var alpha: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &alpha)
        return alpha
    }

}
#endif

// MARK: - Brightness

extension SwiftyColor {

    /// Make the Color lighter.
    /// - Parameter amount: the amount of brightness to apply/
    /// - Returns: The `Color` with the amount lighter applied.
    public func lighter(amount: CGFloat = 0.25) -> SwiftyColor {
        hueColor(withBrightnessAmount: 1 + amount)
    }

    /// Make the Color darker.
    /// - Parameter amount: the amount of dark to apply.
    /// - Returns: The `Color` with the amount darker applied.
    public func darker(amount: CGFloat = 0.25) -> SwiftyColor {
        hueColor(withBrightnessAmount: 1 - amount)
    }

    private func hueColor(withBrightnessAmount amount: CGFloat) -> SwiftyColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        #if os (iOS) || os (tvOS) || os (watchOS)
            if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                return SwiftyColor(hue: hue,
                                   saturation: saturation,
                                   brightness: brightness * amount,
                                   alpha: alpha)
            }
            return self
        #else
            getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
            return SwiftyColor(hue: hue,
                               saturation: saturation,
                               brightness: brightness * amount,
                               alpha: alpha)
        #endif
    }

}
