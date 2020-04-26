//
//  UIFontExtension.swift
//  SwiftyUtils iOS
//
//  Created by Tom Baranes on 26/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

extension UIFont {

    /// A utility object for obtaining custom fonts that scale to support Dynamic Type.
    /// - Parameters:
    ///   - style: The TextStyle that will apply to the font.
    ///   - traits: Optional symbolic traits applied to the font.
    ///   - sizeCategory: Constants indicating the preferred size of your content.
    /// - returns: The dynamic font created.
    @available(iOS 11.0, tvOS 11.0, *)
    public class func dynamicStyle(_ style: UIFont.TextStyle,
                                   traits: UIFontDescriptor.SymbolicTraits?,
                                   sizeCategory: UIContentSizeCategory = .large) -> UIFont {
        let traitcollection = UITraitCollection(preferredContentSizeCategory: sizeCategory)
        let defaultTraitCollection = UITraitCollection(traitsFrom: [UIScreen.main.traitCollection, traitcollection])
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style,
                                                                  compatibleWith: defaultTraitCollection)
        let fontDescriptor: UIFont
        if let traits = traits, let traitsDescriptor = descriptor.withSymbolicTraits(traits) {
            fontDescriptor = UIFont(descriptor: traitsDescriptor, size: 0)
        } else {
            fontDescriptor = UIFont(descriptor: descriptor, size: 0)
        }
        return UIFontMetrics(forTextStyle: style).scaledFont(for: fontDescriptor)
    }

}

#endif
