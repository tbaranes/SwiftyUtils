//
//  NSViewExtension.swift
//  SwiftyUtils
//
//  Created by Vincent CARLIER on 21/09/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Cocoa

// MARK - Localizables

public extension NSView {

    public func convertLocalizables() {
        if subviews.count == 0 {
            return
        }

        for aSubview: NSView in subviews {
            if let aTextField = aSubview as? NSTextField {
                aTextField.stringValue = NSLocalizedString(aTextField.stringValue, comment: "")
                if let placeholder = aTextField.placeholderString {
                    aTextField.placeholderString = NSLocalizedString(placeholder, comment: "")
                }
            } else if let aTextView = aSubview as? NSTextView {
                if let text = aTextView.string {
                    aTextView.string = NSLocalizedString(text, comment: "")
                }
            } else if let aButton = aSubview as? NSButton {
                aButton.title = NSLocalizedString(aButton.title, comment: "")
            } else {
                aSubview.convertLocalizables()
            }
        }
    }

}
