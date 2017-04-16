//
//  Created by Tom Baranes on 27/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

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
        return self.isViewLoaded && view.window != nil
    }

}
