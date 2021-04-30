//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2021 Tom Baranes. All rights reserved.
//

#if os(iOS)
import UIKit

extension UISlider {
    public func value(for gestureRecognizer: UITapGestureRecognizer) -> Float {
        let point = gestureRecognizer.location(in: self)
        let percentage = point.x / bounds.size.width
        let delta = Float(percentage) * (maximumValue - minimumValue)
        return minimumValue + delta
    }
}
#endif
