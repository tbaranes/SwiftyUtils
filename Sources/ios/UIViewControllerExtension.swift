//
//  UIViewControllerExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 26/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

// MARK: - Helpers

extension UIViewController {
 
    public func deletePreviousViewControllers(animated: Bool = false) {
        navigationController?.setViewControllers([self], animated: animated)
    }
    
}

// MARK: - NavigationBar

extension UIViewController {

    public func setupBackButton(hidden: Bool = false, title: String = "", backIndicatorImage: UIImage? = nil, tintColor: UIColor?) {
        navigationItem.hidesBackButton = hidden
        if !hidden {
            navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .Plain, target: nil, action: nil)
            
            if let unwrappedColor = tintColor {
                navigationItem.backBarButtonItem?.tintColor = unwrappedColor
                navigationController?.navigationBar.tintColor = unwrappedColor
            }
            
            if let unwrappedImage = backIndicatorImage {
                navigationController?.navigationBar.backIndicatorImage = unwrappedImage
                navigationController?.navigationBar.backIndicatorTransitionMaskImage = unwrappedImage
            }
        }
    }

    public func setupLeftBarView(view: UIView) {
        let leftBarButtonItem = UIBarButtonItem(customView: unwrappedView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    public func setupRightBarView(view: UIView) {
        let rightBarButtonItem = UIBarButtonItem(customView: unwrappedView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
}
