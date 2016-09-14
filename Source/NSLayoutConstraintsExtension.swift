//
//  Created by Tom Baranes on 25/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

#if !os(watchOS)
public extension NSLayoutConstraint {

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
