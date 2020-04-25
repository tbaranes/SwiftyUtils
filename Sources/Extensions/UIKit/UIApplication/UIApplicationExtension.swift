//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - ViewController

extension UIApplication {

    public func topViewController(from baseVC: UIViewController? = UIApplication.shared.keyWindow?.rootViewController)
                                  -> UIViewController? {
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

// MARK: - Open

@available(iOS 10.0, tvOS 10.0, *)
extension UIApplication {

    /// Open app settings
    public func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        open(url, options: [:], completionHandler: nil)
    }

    /// Open app review page
    /// - Parameter url: `URL` App page url finishing with `write-review`
    public func openAppStoreReviewPage(_ url: URL) {
        DispatchQueue.main.async {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}

// MARK: - AppDelegate

extension UIApplication {
    public static func delegate<T: UIApplicationDelegate>(_ type: T.Type) -> T? {
        UIApplication.shared.delegate as? T
    }
}
#endif
