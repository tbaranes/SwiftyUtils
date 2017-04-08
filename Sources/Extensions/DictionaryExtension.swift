//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Getter

public extension Dictionary {

    public func random() -> Value {
        let index: Int = Int(arc4random_uniform(UInt32(count)))
        return Array(self.values)[index]
    }

}

// MARK: - Helpers

public extension Dictionary {

    public func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }

    public func testAll(test: (Key, Value) -> (Bool)) -> Bool {
        for (key, value) in self {
            if !test(key, value) {
                return false
            }
        }
        return true
    }
}

// MARK: - Transform

public extension Dictionary {

    public func union(values: Dictionary...) -> Dictionary {
        var result = self
        values.forEach { dictionary in
            dictionary.forEach { key, value in
                result.updateValue(value, forKey: key)
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

                self.updateValue(value, forKey: key)
            }
        }
    }

}

// MARK: - Equatable Transform

public extension Dictionary where Value: Equatable {

    public func difference(with dictionaries: [Key: Value]...) -> [Key: Value] {
        var result = self
        dictionaries.forEach {
            for (key, value) in $0 {
                if result.has(key: key) && result[key] == value {
                    result.removeValue(forKey: key)
                }
            }
        }
        return result
    }

}
