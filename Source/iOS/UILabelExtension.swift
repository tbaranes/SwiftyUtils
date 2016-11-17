//
//  UILabelExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 16/11/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

extension UILabel {

    public func setText(_ text: String, truncatedText: String) {
        var text = text
        self.text = text
        while isTruncated() && text.length > 0 {
            text = String(text.characters.dropLast())
            self.text = text + truncatedText
        }
    }

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
