//
//  Reusable.swift
//  SwiftyUtils iOS
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// Make your `UITableViewCell` and `UICollectionViewCell` conform to `Reusable`
/// to dequeue them safely when they are only code based.
public protocol Reusable: AnyObject {
    /// The reuse identifier to use when registering and later dequeuing a reusable cell
    static var reuseIdentifier: String { get }
}

/// Make your `UITableViewCell` and `UICollectionViewCell` conform to `NibReusable`
/// to dequeue them safely when they are Nib-based.
public typealias NibReusable = Reusable & NibLoadable

extension Reusable {
    /// Use the name of the `class` as `String` for its `reuseIdentifier`
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
#endif
