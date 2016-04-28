//
// UIViewControllerExtension.swift
//
// Copyright (c) 2016 Tom Baranes
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
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
