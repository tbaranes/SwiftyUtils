//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

extension UIApplication {

    public func topViewController(from baseVC: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        guard let baseVC = baseVC else {
            return nil
        }

        if let nav = baseVC as? UINavigationController {
            return topViewController(from: nav.visibleViewController)
        } else if let tab = baseVC as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(from: selected)
        } else if let presented = baseVC.presentedViewController {
            return topViewController(from: presented)
        }
        return baseVC
    }

}

public extension UIApplication {
    public static func delegate<T: UIApplicationDelegate>(_ type: T.Type) -> T? {
        return UIApplication.shared.delegate as? T
    }
}
