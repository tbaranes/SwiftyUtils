//
//  Created by Tom Baranes on 27/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Navigation

extension UIViewController {

    public func removePreviousControllers(animated: Bool = false) {
        navigationController?.setViewControllers([self], animated: animated)
    }

}

// MARK: - Misc

extension UIViewController {

    public var isVisible: Bool {
        self.isViewLoaded && view.window != nil
    }

}

#endif
