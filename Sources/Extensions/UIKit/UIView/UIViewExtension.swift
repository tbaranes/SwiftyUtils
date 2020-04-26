//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Frame

extension UIView {

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

// MARK: - Corner Radius

extension UIView {

    /// Apply a corner radius to the view.
    /// - Parameter radius: The radius that will be applied to the view.
    /// - Parameter maskedCorners: The corners on which the radius will be applied. Default value is all corners.
    @available(iOS 11.0, tvOS 11.0, *)
    public func applyCornerRadius(_ radius: CGFloat, maskedCorners: CACornerMask = [.layerMaxXMaxYCorner,
                                                                                    .layerMaxXMinYCorner,
                                                                                    .layerMinXMaxYCorner,
                                                                                    .layerMinXMinYCorner]) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = maskedCorners
        self.layer.masksToBounds = true
    }

}

// MARK: - Localizables

extension UIView {

    /// Automatically translate all the subviews using their text as localizable's key.
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

    /// Find a subview using it's accessibility identifier. This is useful to test private view outlets.
    /// - Parameter identifier: The accessibility identifier to look for.
    /// - Returns: The view corresponding to the identifier, if none then it will return nil.
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

// MARK: - Constraints

@available(iOS 9.0, *)
extension UIView {

    /// Add constraints to its superview.
    /// - Parameters:
    ///   - edges: The edges where a new constraint will be added. Default value is `.all`.
    ///   - insets: The constant that will be applied to the new constraint.
    ///             For example, the edge `.top` constant will be equal to the inset `.top`.
    ///             Default value is `.zero`.
    public func addConstraints(to edges: UIRectEdge = .all, insets: UIEdgeInsets = .zero) {
        guard let superview = superview else {
            fatalError("No superview found, add your view in another before adding constraints.")
        }

        translatesAutoresizingMaskIntoConstraints = false
        if edges.contains(.top) {
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        }
        if edges.contains(.bottom) {
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom).isActive = true
        }
        if edges.contains(.left) {
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
        }
        if edges.contains(.right) {
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right).isActive = true
        }
    }

}

#endif
