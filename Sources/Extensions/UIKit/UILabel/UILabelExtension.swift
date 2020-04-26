//
//  Created by Tom Baranes on 16/11/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Text style

extension UILabel {

    /// Set the label line height multiple.
    ///
    /// The natural line height of the receiver is multiplied by this factor (if positive)
    /// before being constrained by minimum and maximum line height.
    ///
    /// - Parameter lineHeight: The line height multiple that will be applied to the label.
    public func setLineHeight(_ lineHeight: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.0
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineBreakMode = lineBreakMode

        let attrString = NSMutableAttributedString(string: text!)
        let range = NSRange(location: 0, length: attrString.length)
        attrString.addAttribute(.font, value: font!, range: range)
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        attributedText = attrString
    }

}

// MARK: - Text

extension UILabel {

    /// Set the label's text with a custom truncated text (instead of `...`)  if needed.
    /// - Parameters:
    ///   - text: The text that will set to the label.
    ///   - truncatedText: The text that will be used in to replace the `...` if needed.
    public func setText(_ text: String, truncatedText: String) {
        var text = text
        self.text = text
        while isTruncated() && text.isNotEmpty {
            text = String(text.dropLast())
            self.text = text + truncatedText
        }
    }

}

// MARK: - Misc

extension UILabel {

    /// Check if the text is truncated or not.
    /// - Returns: true if the text is truncated, otherwise false.
    public func isTruncated() -> Bool {
        guard let string = text else {
            return false
        }

        let rectSize = CGSize(width: self.width, height: .greatestFiniteMagnitude)
        let size: CGSize = (string as NSString).boundingRect(with: rectSize,
                                                             options: .usesLineFragmentOrigin,
                                                             attributes: [NSAttributedString.Key.font: font!],
                                                             context: nil).size
        return (size.height > self.bounds.size.height)
    }

}

// MARK: - Fonts

extension UILabel {

    /// Set a dynamic font to the label.
    /// - Parameters:
    ///   - style: The UIFont.TextStyle that will set to the label.
    ///   - traits: Optional symbolic traits applied to the font. Default value is nil.
    ///   - minimumScaleFactor: The minimum scale factor supported for the label’s text. Default value is 0.8.
    @available(iOS 11.0, tvOS 11.0, *)
    public func configureDynamicStyle(_ style: UIFont.TextStyle,
                                      traits: UIFontDescriptor.SymbolicTraits? = nil,
                                      minimumScaleFactor: CGFloat = 0.8) {
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        allowsDefaultTighteningForTruncation = true
        self.minimumScaleFactor = minimumScaleFactor
        font = UIFont.dynamicStyle(style, traits: traits)
    }

}

#endif
