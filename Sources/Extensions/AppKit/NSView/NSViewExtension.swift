//
//  Created by Vincent CARLIER on 21/09/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(macOS)

import Cocoa

// MARK: - Localizables

extension NSView {

    /// Automatically translate all the subviews using their text as localizable's key.
    @objc
    public func convertLocalizables() {
        if subviews.isEmpty {
            return
        }

        for aSubview: NSView in subviews {
            if let aTextField = aSubview as? NSTextField {
                aTextField.stringValue = NSLocalizedString(aTextField.stringValue, comment: "")
                if let placeholder = aTextField.placeholderString {
                    aTextField.placeholderString = NSLocalizedString(placeholder, comment: "")
                }
            } else if let aTextView = aSubview as? NSTextView {
                aTextView.string = NSLocalizedString(aTextView.string, comment: "")
            } else if let aButton = aSubview as? NSButton {
                aButton.title = NSLocalizedString(aButton.title, comment: "")
            } else {
                aSubview.convertLocalizables()
            }
        }
    }

}

// MARK: - Frame

extension NSView {

    /// Get or set the NSView's frame `x` value.
    public var x: CGFloat {
        get { frame.x }
        set { frame = frame.with(x: newValue) }
    }

    /// Get or set the NSView's frame `y` value.
    public var y: CGFloat {
        get { frame.y }
        set { frame = frame.with(y: newValue) }
    }

    /// Get or set the NSView's frame `width` value.
    public var width: CGFloat {
        get { frame.width }
        set { frame = frame.with(width: newValue) }
    }

    /// Get or set the NSView's frame `height` value.
    public var height: CGFloat {
        get { frame.height }
        set { frame = frame.with(height: newValue) }
    }
}

#endif
