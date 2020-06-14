//
//  SequenceExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 14/06/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - KeyPath

extension Sequence {

    /// Sort a sequence using `keyPath`
    /// - Parameters:
    ///   - keyPath: The `keyPath` that will be used to do the sort
    ///   - order: The sort order that will be applied. Default value is `<`
    /// - Returns: The sorted sequence.
    public func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, order: (T, T) -> Bool = (<)) -> [Element] {
        sorted {
            order($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
    }

}
