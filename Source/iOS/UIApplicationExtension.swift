//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public extension UIApplication {

    public func topViewController(baseViewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        guard let base = baseViewController else {
            return nil
        }

        if let nav = base as? UINavigationController {
            return topViewController(baseViewController: nav.visibleViewController)
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(baseViewController: selected)
        } else if let presented = base.presentedViewController {
            return topViewController(baseViewController: presented)
        }
        return base
    }

}
