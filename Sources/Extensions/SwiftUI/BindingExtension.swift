//
//  File.swift
//  
//
//  Created by Tom Baranes on 25/05/2020.
//
// Inspired from: https://www.swiftbysundell.com/articles/getting-the-most-out-of-xcode-previews/
//

#if canImport(SwiftUI) && (arch(arm64) || arch(x86_64))
import SwiftUI

@available(iOS 13.0, tvOS 13.0, macOS 10.15, watchOS 6.0, *)
extension Binding {

    /// Pass an interactive value that’ll act as a preview stand-in for a binding
    public static func mock(_ value: Value) -> Self {
        var value = value
        return Binding(get: { value },
                       set: { value = $0 })
    }

}
#endif
