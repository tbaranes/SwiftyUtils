//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Subscript

extension UserDefaults {

    /// Subscript to get a UserDefaults value for a specified key.
    /// - Parameter key: A key in the current user‘s defaults database.
    /// - Returns:The object associated with the specified key, or nil if the key was not found.
    public subscript(key: String) -> Any? {
        get {
            object(forKey: key)
        }
        set {
            set(newValue, forKey: key)
        }
    }

}

// MARK: - Misc

extension UserDefaults {

    /// Check if a key exists in the user's defaults database.
    /// - Parameter key: A key in the current user‘s defaults database.
    /// - Returns: true if the element was found in the sequence; otherwise, false.
    @objc
    public static func has(key: String) -> Bool {
        self.standard.has(key: key)
    }

    /// Check if a key exists in the user's defaults database.
    /// - Parameter key: A key in the current user‘s defaults database.
    /// - Returns: true if the element was found in the sequence; otherwise, false.
    @objc
    public func has(key: String) -> Bool {
        self.dictionaryRepresentation().keys.contains(key)
    }

}

// MARK: - Remove

extension UserDefaults {

    /// Remove all the keys and their values stored in the user's defaults database.
    public func removeAll() {
        for (key, _) in dictionaryRepresentation() {
            removeObject(forKey: key)
        }
    }

}
