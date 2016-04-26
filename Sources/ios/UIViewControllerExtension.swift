//
//  UIViewControllerExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 26/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

extension UIViewController {
 
    public func deletePreviousViewControllers(animated: Bool = false) {
        navigationController?.setViewControllers([self], animated: animated)
    }
    
}
