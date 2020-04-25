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

    /// add right image with custom offset to current button
    /// - Parameters:
    ///     - image: `UIImage?`
    ///     - offset: `CGFloat`
    public func addRightImage(_ image: UIImage?, offset: CGFloat) {
        setImage(image, for: .normal)
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        imageView?.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
        imageView?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset).isActive = true
    }
}

#endif
