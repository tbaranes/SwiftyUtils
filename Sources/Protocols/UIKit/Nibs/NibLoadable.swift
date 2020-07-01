//
//  NibLoadable.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// Make your `UIView` subclasses conform to this protocol to instantiate them from their NIB safely.
/// - Note: Be sure that your `UIView` is based on a Nib, and is used as the Xib's root view.
public protocol NibLoadable: AnyObject {
    /// The nib file to use to load a new instance of the View from a Xib.
    static var nib: UINib { get }
}

extension NibLoadable {
    /// Use by default the nib which have the same name as the the class and located in the bundle of that class
    public static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

// MARK: - Instantiation from NIB

extension NibLoadable where Self: UIView {
    /// Returns a `UIView` object instantiated from nib
    /// - Returns: A  valid instance of `UIView` & `NibLoadable`, otherwise it will send a `fatalError`
    public static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}
#endif
