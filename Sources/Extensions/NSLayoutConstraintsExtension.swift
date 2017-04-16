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
