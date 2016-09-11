//
//  Created by Tom Baranes on 27/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

// MARK: - Helpers

public extension UIViewController {

    public func deletePreviousViewControllers(animated: Bool = false) {
        navigationController?.setViewControllers([self], animated: animated)
    }

}

// MARK: - NavigationBar

public extension UIViewController {

    public func setupBackButton(hidden: Bool = false, title: String = "", backIndicatorImage: UIImage? = nil, tintColor: UIColor? = UIColor.white) {
        navigationItem.hidesBackButton = hidden
        if !hidden {
            navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)

            if let unwrappedColor = tintColor {
                navigationItem.backBarButtonItem?.tintColor = unwrappedColor
                navigationController?.navigationBar.tintColor = unwrappedColor
            }

            if let unwrappedImage = backIndicatorImage {
                navigationController?.navigationBar.backIndicatorImage = unwrappedImage
                navigationController?.navigationBar.backIndicatorTransitionMaskImage = unwrappedImage
            }
        }
    }

    public func setupBar(leftView: UIView) {
        let leftBarButtonItem = UIBarButtonItem(customView: leftView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    public func setupBar(rightView: UIView) {
        let rightBarButtonItem = UIBarButtonItem(customView: rightView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

}
