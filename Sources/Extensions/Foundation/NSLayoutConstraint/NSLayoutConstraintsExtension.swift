//
//  Created by Tom Baranes on 25/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

#if !os(watchOS)
extension NSLayoutConstraint {

    /// Update the constraint's constant by multipilying the view's width or height
    /// (depending on the `firstAttribute`) and the new multiplier.
    ///
    /// That method is working only when `firstAttribute` is equal to `.width` or `.height`,
    /// nothing will happen.
    /// - Parameters:
    ///   - multiplier: the multiplier which will be applied to the constant.
    ///   - toView: the view used to get the width or height to calculate the new constant.
    public func apply(multiplier: CGFloat, toView: SwiftyView) {
        switch firstAttribute {
        case .width:
            constant = toView.bounds.width * multiplier
        case .height:
            constant = toView.bounds.height * multiplier
        default:
            break
        }
    }

}
#endif
