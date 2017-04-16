//
//  Created by Tom Baranes on 15/09/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public protocol Iteratable {}
extension Iteratable where Self: RawRepresentable & Hashable {}

public func iterateEnum<T: Hashable>(_ from: T.Type) -> AnyIterator<T> {
    var x = 0
    return AnyIterator {
        let next = withUnsafePointer(to: &x) {
            $0.withMemoryRebound(to: T.self, capacity: 1) { $0.pointee }
        }
        defer {
            x += 1
        }
        return next.hashValue == x ? next : nil
    }
}
