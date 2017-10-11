//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Subscript

extension UserDefaults {

    public subscript(key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        set {
            set(newValue, forKey: key)
        }
    }

}

// MARK: - Misc

extension UserDefaults {

    @objc
    public static func has(key: String) -> Bool {
        return self.standard.has(key: key)
    }

    @objc
    public func has(key: String) -> Bool {
        return self.dictionaryRepresentation().keys.contains(key)
    }

}

// MARK: - Remove

extension UserDefaults {

    public func removeAll() {
        for (key, _) in dictionaryRepresentation() {
            removeObject(forKey: key)
        }
    }

}
