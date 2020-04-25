//
//  Created by Vincent CARLIER on 21/09/2016.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(macOS)

import Cocoa

// MARK: - Localizables

extension NSView {

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
    public var x: CGFloat {
        get { frame.x }
        set { frame = frame.with(x: newValue) }
    }

    public var y: CGFloat {
        get { frame.y }
        set { frame = frame.with(y: newValue) }
    }

    public var width: CGFloat {
        get { frame.width }
        set { frame = frame.with(width: newValue) }
    }

    public var height: CGFloat {
        get { frame.height }
        set { frame = frame.with(height: newValue) }
    }
}

#endif
