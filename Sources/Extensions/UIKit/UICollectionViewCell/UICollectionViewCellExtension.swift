//
//  UICollectionViewCell.swift
//  SwiftyUtils iOS
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if os(iOS)

import UIKit

extension UICollectionViewCell {

    /// Apply corner radius
    /// - Parameters:
    ///     - radius: `CGFloat`
    public func applyCornerRadius(_ radius: CGFloat) {
        contentView.layer.cornerRadius = radius
        contentView.layer.masksToBounds = true
    }

}

// MARK: - Animations

extension UICollectionViewCell {

    /// animate on highlighted with value for duration and scale
    /// - Parameters:
    ///     - shouldScale: `Bool`
    ///     - duration: `TimeInterval`, default is `0.35`
    ///     - scale: `CGFloat`, default is `0.97`
    ///     - damping: `CGFloat`, default is `0.7`
    ///     - options: `UIView.AnimationOptions`, default is `[]` empty
    ///     - delay: `TimeInterval`, default is `0.0`
    ///     - velocity: `CGFloat`, default is `0.0`
    public func animate(scale: Bool,
                        duration: TimeInterval = 0.35,
                        transformScale: CGFloat = 0.97,
                        damping: CGFloat = 0.7,
                        options: UIView.AnimationOptions = [],
                        delay: TimeInterval = 0.0,
                        velocity: CGFloat = 0.0,
                        completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity,
                       options: options,
                       animations: { [unowned self] in
                        let scaleTransform = CGAffineTransform(scaleX: transformScale, y: transformScale)
                        self.contentView.transform = scale ? scaleTransform : .identity
            }, completion: completion)
    }

}

#endif
