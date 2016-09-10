//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation
import UIKit

// MARK - Localizables

public extension UIView {

    // swiftlint:disable:next cyclomatic_complexity
    public func convertLocalizables() {
        if subviews.count == 0 {
            return
        }

        for aSubview: UIView in subviews {
            if let aLabel = aSubview as? UILabel {
                if let text = aLabel.text {
                    aLabel.text = NSLocalizedString(text, comment: "")
                }
            } else if let aTextField = aSubview as? UITextField {
                if let text = aTextField.text {
                    aTextField.text = NSLocalizedString(text, comment: "")
                }
                if let placeholder = aTextField.placeholder {
                    aTextField.placeholder = NSLocalizedString(placeholder, comment: "")
                }
            } else if let aTextView = aSubview as? UITextView {
                if let text = aTextView.text {
                    aTextView.text = NSLocalizedString(text, comment: "")
                }
            } else if let aButton = aSubview as?  UIButton {
                if let title = aButton.title(for: []) {
                    aButton.setTitle(NSLocalizedString(title, comment: ""), for: [])
                }
            } else {
                aSubview.convertLocalizables()
            }
        }
    }

}

// MARK: - Nib

public extension UIView {

    public class func fromNib<T: UIView>(nibNameOrNil: String? = nil) -> T {
        let v: T? = fromNib(nibNameOrNil: nibNameOrNil)
        return v!
    }

    public class func fromNib<T: UIView>(nibNameOrNil: String? = nil) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            name = T.className
        }

        guard let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil) else {
            return nil
        }

        for v in nibViews {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
}
