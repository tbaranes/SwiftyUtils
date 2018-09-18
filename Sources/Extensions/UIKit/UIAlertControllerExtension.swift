//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

// MARK: - Initializers

extension UIAlertController {

    @objc
    public convenience init(title: String,
                            message: String? = nil,
                            defaultActionButtonTitle: String = "OK",
                            defaultActionButtonStyle: UIAlertAction.Style = .default,
                            tintColor: UIColor? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: defaultActionButtonStyle, handler: nil)
        addAction(defaultAction)
        if let color = tintColor {
            view.tintColor = color
        }
    }

}

// MARK: - Show

extension UIAlertController {

    @objc
    public func show(animated: Bool = true, completion: (() -> Void)? = nil) {
        UIApplication.shared.topViewController()?.present(self, animated: animated, completion: completion)
    }

}

// MARK: - Actions

extension UIAlertController {

    @discardableResult
    func addAction(title: String,
                   style: UIAlertAction.Style = .default,
                   isEnabled: Bool = true,
                   handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        action.isEnabled = isEnabled
        addAction(action)
        return action
    }

}
