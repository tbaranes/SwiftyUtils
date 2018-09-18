//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Initializer

extension Dictionary {

    public init<C>(elements: C) where C: Collection, C.Iterator.Element == (Key, Value) {
        self.init()
        for (key, value) in elements {
            self[key] = value
        }
    }

}

// MARK: - Helpers

extension Dictionary {

    public func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }

}

// MARK: - Transform

extension Dictionary {

    public func union(values: Dictionary...) -> Dictionary {
        var result = self
        values.forEach { dictionary in
            dictionary.forEach { key, value in
                result[key] = value
            }
        }
        return result
    }

    public mutating func merge<K, V>(with dictionaries: [K: V]...) {
        dictionaries.forEach {
            for (key, value) in $0 {
                guard let value = value as? Value, let key = key as? Key else {
                    continue
                }

                self[key] = value
            }
        }
    }

}

// MARK: - Equatable Transform

extension Dictionary where Value: Equatable {

    public func difference(with dictionaries: [Key: Value]...) -> [Key: Value] {
        var result = self
        dictionaries.forEach {
            for (key, value) in $0 {
                if result.has(key: key) && result[key] == value {
                    result[key] = nil
                }
            }
        }
        return result
    }

}
