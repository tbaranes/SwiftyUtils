//
//  UIApplicationExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

extension UIApplication {
    
    func topViewController(baseViewController: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController) -> UIViewController? {
        guard let base = baseViewController else {
            return nil
        }
        
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        } else if let tab = base as? UITabBarController, selected = tab.selectedViewController {
            return topViewController(selected)
        } else if let presented = base.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
}

func test() {
    UIApplication.sharedApplication().topViewController()
}