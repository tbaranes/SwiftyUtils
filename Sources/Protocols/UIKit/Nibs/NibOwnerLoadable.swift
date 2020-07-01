//
//  NibOwnerLoadable.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// Make your `UIView` subclasses conform to this protocol to instantiate them from their Xib's File Owner safely.
/// - Note: Be sure that your `UIView` is based on a Nib, and is used as the Xib's File's Owner.
public protocol NibOwnerLoadable: AnyObject {
    /// The nib file to use to load a new instance of the View from a Xib.
    static var nib: UINib { get }
}

// MARK: Default implementation

extension NibOwnerLoadable {
    /// Use by default the nib which have the same name as the the class and located in the bundle of that class
    public static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// MARK: - Instantiation from NIB

extension NibOwnerLoadable where Self: UIView {
    /// Adds content loaded from the nib to the end of the receiver's list of subviews
    /// and adds constraints automatically.
    public func loadNibContent() {
        let layoutAttributes: [NSLayoutConstraint.Attribute] = [.top, .leading, .bottom, .trailing]
        for case let view as UIView in Self.nib.instantiate(withOwner: self, options: nil) {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            NSLayoutConstraint.activate(layoutAttributes.map {
                NSLayoutConstraint(item: view,
                                   attribute: $0,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: $0,
                                   multiplier: 1,
                                   constant: 0.0)
            })
        }
    }
}
#endif
