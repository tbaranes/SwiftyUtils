//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// Inspired from http://ericasadun.com/2016/04/18/default-reflection/
public protocol Selfie: CustomStringConvertible {}

public extension Selfie {

    public var description: String {
        let mirror = Mirror(reflecting: self)
        return "\(mirror.subjectType)( \(mirror.children.map({ "\($0!): \($1)" }).joined(separator: ", ")))"
    }

}
