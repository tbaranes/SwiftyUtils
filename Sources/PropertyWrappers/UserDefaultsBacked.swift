//
//  UserDefaultsBacked.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//
// Inspiration from: https://www.swiftbysundell.com/articles/property-wrappers-in-swift/
//

import Foundation

/// A property wrapper to get or set values in a user's defaults database.
@propertyWrapper
public struct UserDefaultsBacked<Value> {
    private let key: String
    private let defaultValue: Value
    private var storage: UserDefaults

    /// Initialize a `UserDefaultsBacked` with a default value.
    /// - Parameters:
    ///   - key: The name of one of the receiver's properties.
    ///   - defaultValue: The default value to use if there's none in the database.
    ///   - storage: The `UserDefaults` database to use. The default value is `.standard`.
    public init(key: String, defaultValue: Value, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }

    public var wrappedValue: Value {
        get {
            let value = storage.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                storage.removeObject(forKey: key)
            } else {
                storage.setValue(newValue, forKey: key)
            }
        }
    }
}

extension UserDefaultsBacked where Value: ExpressibleByNilLiteral {

    /// Initialize a `UserDefaultsBacked` without default value.
    /// - Parameters:
    ///   - key: The name of one of the receiver's properties.
    ///   - storage: The `UserDefaults` database to use. The default value is `.standard`.
    public init(key: String, storage: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, storage: storage)
    }

}
