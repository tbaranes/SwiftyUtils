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

    /// Apply corner radius to the cell.
    /// - Parameters:
    ///     - radius: The radius that will be applied to the cell.
    public func applyCornerRadius(_ radius: CGFloat) {
        contentView.layer.cornerRadius = radius
        contentView.layer.masksToBounds = true
    }

}

// MARK: - Animations

extension UICollectionViewCell {

    /// Configure and animate the cell animation, mainly used when the cell is highlighted.
    /// - Parameters:
    ///     - shouldScale: Either the animation should do a scale animation or not.
    ///     - duration: The animation duration. Default value is `0.35`
    ///     - transformScale: The transform scale delta. Default value is `0.97`
    ///     - damping: The damping ratio for the spring animation as it approaches its quiescent state.
    ///                Default value is `0.7`
    ///     - options: A mask of options indicating how you want to perform the animations. Default value is empty.
    ///     - delay: The delay duration before starting the animation. Default value is `0.0`
    ///     - velocity: `CGFloat`, default is `0.0`
    ///     - completion: An optional block called once the animation did finish. Default value is nil.
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
