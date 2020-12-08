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
    /// Find the `ViewController` which contains this view.
    /// - Returns: The view controller that contains this view, if none then it will return nil.
    public var parentViewController: UIViewController? {
        if let nextResponder = next as? UIViewController {
            return nextResponder
        } else if let nextResponder = next as? UIView {
            return nextResponder.parentViewController
        }
        return nil
    }

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

    /// Find the first subview corresponding to a  specific type
    /// - Returns: The view corresponding to the type, if none then it will return nil.
    public func findView<T>() -> T? {
        if let view = self as? T {
            return view
        }

        if #available(iOS 9.0, *), let stackView = self as? UIStackView {
            return findView(in: stackView.arrangedSubviews)
        }
        return findView(in: subviews)
    }

    private func findView<T>(in views: [UIView]) -> T? {
        for view in views {
            if let view: T = view.findView() {
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

// MARK: - SwiftUI

#if canImport(SwiftUI) && (arch(arm64) || arch(x86_64))
import SwiftUI

@available(iOS 13.0, tvOS 13.0, *)
extension UIView {
    /// Add a SwiftUI `View` as a child of the input `UIView`.
    /// - Parameters:
    ///   - swiftUIView: The SwiftUI `View` to add as a child.
    ///   - view: The `UIView` instance to which the view should be added.
    public func addSubSwiftUIView<Content>(_ swiftUIView: Content) where Content: View {
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.view.backgroundColor = .clear
        addSubview(hostingController.view)
        hostingController.view.addConstraints()
    }
}
#endif

// MARK: - Borders

extension UIView {
    private static let borderSideLayerId = "swiftyutils_borderSideLayer"

    public func addBorders(to edges: UIRectEdge, borderColor: UIColor, borderWidth: CGFloat) {
        clearLayer()
        drawBordersSides(to: edges, borderColor: borderColor, borderWidth: borderWidth)
    }

    private func clearLayer() {
        layer.borderColor = nil
        layer.borderWidth = 0
        layer.sublayers?
            .filter { $0.name == Self.borderSideLayerId }
            .forEach { $0.removeFromSuperlayer() }
    }

    private func drawBordersSides(to edges: UIRectEdge, borderColor: UIColor, borderWidth: CGFloat) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = Self.borderSideLayerId
        shapeLayer.path = makeBorderPath(to: edges, borderWidth: borderWidth).cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = borderColor.cgColor
        shapeLayer.lineWidth = borderWidth
        shapeLayer.frame = bounds
        layer.masksToBounds = true
        layer.insertSublayer(shapeLayer, at: 0)
    }

    private func makeBorderPath(to edges: UIRectEdge, borderWidth: CGFloat) -> UIBezierPath {
        let lines = makeLines(to: edges, borderWidth: borderWidth)
        let borderPath = UIBezierPath()
        lines.forEach {
            borderPath.move(to: $0.start)
            borderPath.addLine(to: $0.end)
        }
        return borderPath
    }

    private func makeLines(to edges: UIRectEdge, borderWidth: CGFloat) -> [(start: CGPoint, end: CGPoint)] {
        let shift = borderWidth / 2
        var lines = [(start: CGPoint, end: CGPoint)]()
        if edges.contains(.top) {
            lines.append((start: CGPoint(x: 0, y: shift), end: CGPoint(x: bounds.size.width, y: shift)))
        }
        if edges.contains(.right) {
            lines.append((start: CGPoint(x: bounds.size.width - shift, y: 0),
                          end: CGPoint(x: bounds.size.width - shift, y: bounds.size.height)))
        }
        if edges.contains(.bottom) {
            lines.append((start: CGPoint(x: 0, y: bounds.size.height - shift),
                          end: CGPoint(x: bounds.size.width, y: bounds.size.height - shift)))
        }
        if edges.contains(.left) {
            lines.append((start: CGPoint(x: shift, y: 0),
                          end: CGPoint(x: shift, y: bounds.size.height)))
        }
        return lines
    }
}
#endif
