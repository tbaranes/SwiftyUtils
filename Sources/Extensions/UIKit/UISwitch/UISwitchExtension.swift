//
//  Created by Tom Baranes on 23/06/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS)

import UIKit

// MARK: - Misc

extension UISwitch {

    /// Toggle a switch state.
    /// - Parameter animated: true if you want to animate the toggle, otherwise false.
    public func toggle(animated: Bool = true) {
        self.setOn(!isOn, animated: animated)
    }

}

#endif
