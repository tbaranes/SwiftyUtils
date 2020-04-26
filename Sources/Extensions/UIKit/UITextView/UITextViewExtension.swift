//
//  UITextViewExtension.swift
//  SwiftyUtils iOS Tests
//
//  Created by Tom Baranes on 26/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Font

extension UITextView {

    /// Set a dynamic font to the label.
    /// - Parameters:
    ///   - style: The UIFont.TextStyle that will set to the label.
    ///   - traits: Optional symbolic traits applied to the font. Default value is nil.
    @available(iOS 11.0, tvOS 11.0, *)
    public func configureDynamicStyle(_ style: UIFont.TextStyle,
                                      traits: UIFontDescriptor.SymbolicTraits? = nil) {
        adjustsFontForContentSizeCategory = true
        font = UIFont.dynamicStyle(style, traits: traits)
    }

}

#endif
