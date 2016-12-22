//
//  UILabelExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 16/11/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

extension UILabel {

    // MARK: Set

    public func setLineHeight(_ lineHeight: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.0
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.alignment = self.textAlignment

        let attrString = NSMutableAttributedString(string: self.text!)
        attrString.addAttribute(NSFontAttributeName, value: self.font, range: NSRange(location: 0, length: attrString.length))
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range: NSRange(location: 0, length: attrString.length))
        self.attributedText = attrString
    }

    public func setText(_ text: String, truncatedText: String) {
        var text = text
        self.text = text
        while isTruncated() && text.length > 0 {
            text = String(text.characters.dropLast())
            self.text = text + truncatedText
        }
    }

}

// MARK: - Helpers

extension UILabel {

    public func isTruncated() -> Bool {
        guard let string = self.text else {
            return false
        }

        let size: CGSize = (string as NSString).boundingRect(with: CGSize(width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude),
                                                             options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                             attributes: [NSFontAttributeName: self.font],
                                                             context: nil).size
        return (size.height > self.bounds.size.height)
    }

}
