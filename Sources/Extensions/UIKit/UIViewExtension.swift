//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Frame

extension UIView {
    public var x: CGFloat {
        get { return frame.x }
        set { frame = frame.with(x: newValue) }
    }

    public var y: CGFloat {
        get { return frame.y }
        set { frame = frame.with(y: newValue) }
    }

    public var width: CGFloat {
        get { return frame.width }
        set { frame = frame.with(width: newValue) }
    }

    public var height: CGFloat {
        get { return frame.height }
        set { frame = frame.with(height: newValue) }
    }
}

// MARK: - Localizables

extension UIView {

    @objc
    public func translateSubviews() {
        if subviews.isEmpty {
            return
        }

        for subview in subviews {
            translate(subview)
            if #available(iOS 9.0, *), let stackView = subview as? UIStackView {
                stackView.arrangedSubviews.forEach {
                    self.translate($0)
                    $0.translateSubviews()
                }
            } else {
                subview.translateSubviews()
            }
        }
    }

    private func translate(_ subview: UIView) {
        if let label = subview as? UILabel {
            label.text = NSLocalizedString(label.text ?? "", comment: "")
        } else if let textField = subview as? UITextField {
            textField.text = NSLocalizedString(textField.text ?? "", comment: "")
            textField.placeholder = NSLocalizedString(textField.placeholder ?? "", comment: "")
        } else if let textView = subview as? UITextView {
            textView.text = NSLocalizedString(textView.text, comment: "")
        } else if let button = subview as? UIButton {
            let states: [UIControl.State] = [.normal, .selected, .highlighted, .disabled, .application, .reserved]
            for state in states where button.title(for: state) != nil {
                button.setTitle(NSLocalizedString(button.title(for: state) ?? "", comment: ""), for: state)
            }
        }
    }

}

// MARK: - Find View

extension UIView {

    public func findView(forIdentifier identifier: String) -> UIView? {
        if accessibilityIdentifier == identifier {
            return self
        }

        if #available(iOS 9.0, *), let stackView = self as? UIStackView {
            return findView(in: stackView.arrangedSubviews, forIdentifier: identifier)
        }
        return findView(in: subviews, forIdentifier: identifier)
    }

    private func findView(in views: [UIView], forIdentifier identifier: String) -> UIView? {
        for view in views {
            if let view = view.findView(forIdentifier: identifier) {
                return view
            }
        }
        return nil
    }

}

#endif
