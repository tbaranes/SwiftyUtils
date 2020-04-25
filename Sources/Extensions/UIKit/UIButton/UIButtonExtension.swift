//
//  UIButtonExtension.swift
//  SwiftyUtils iOS
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

@available(iOS 9.0, *)
extension UIButton {

    /// Add a right image with custom offset to the current button.
    /// - Parameters:
    ///     - image: The image that will be added to the button.
    ///     - offset: The trailing margin that will be added between the image and the button's right border.
    public func addRightImage(_ image: UIImage?, offset: CGFloat) {
        setImage(image, for: .normal)
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
        imageView?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset).isActive = true
    }
}

#endif
