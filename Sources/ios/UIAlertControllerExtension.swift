//
//  UIAlertControllerExtension.swift
//  KaraFun
//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Recisio. All rights reserved.
//

import Foundation

public extension UIAlertController {
    
    public static func show(title title: String, message: String, cancelTitle: String = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        UIApplication.sharedApplication().topViewController()?.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
