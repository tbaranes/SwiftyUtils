//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Initializers

extension UIAlertController {

    /// Create a new `UIAlertController` with a default button.
    /// - Parameters:
    ///   - title: The alert's title.
    ///   - title: The alert's message. Default value is nil.
    ///   - defaultActionButtonTitle: The default alert action button's title. Default value is `OK`
    ///   - defaultActionButtonStyle: The default alert action button's style. Default value is `.default`
    ///   - tintColor: The alert's tint color. Default value is `nil`
    /// - Returns: The `UIAlertController` created.
    @objc
    public convenience init(title: String,
                            message: String? = nil,
                            defaultActionButtonTitle: String = "OK",
                            defaultActionButtonStyle: UIAlertAction.Style = .default,
                            tintColor: UIColor? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle,
                                          style: defaultActionButtonStyle,
                                          handler: nil)
        addAction(defaultAction)
        if let color = tintColor {
            view.tintColor = color
        }
    }

}

// MARK: - Show

extension UIAlertController {

    /// Show the alert controller from the top view controller.
    /// - Parameters:
    ///   - animated: true or false, default value is true.
    ///   - completion: Block called once the alert has been presented.
    @objc
    public func show(animated: Bool = true, completion: (() -> Void)? = nil) {
        UIApplication.shared.topViewController()?.present(self, animated: animated, completion: completion)
    }

}

// MARK: - Actions

extension UIAlertController {

    /// Add an action to the alert controller.
    /// - Parameters:
    ///   - title: The action's title.
    ///   - style: The action style. Default value is `.default`
    ///   - isEnabled: Indicates if the action button is enabeld or not.
    ///   - handler: An optional block called when the buton is pressed.
    ///              The block takes one parameter corresponding to the action pressed.
    ///              Default value is nil.
    /// - Returns: The `UIAlertAction` created.
    @discardableResult
    public func addAction(title: String,
                          style: UIAlertAction.Style = .default,
                          isEnabled: Bool = true,
                          handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        action.isEnabled = isEnabled
        addAction(action)
        return action
    }

}

#endif
