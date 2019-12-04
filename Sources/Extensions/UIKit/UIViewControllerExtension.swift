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

// MARK: - ChildVC

@available(iOS 9.0, *)
extension UIViewController {

    public func addChildController(_ controller: UIViewController,
                                   to subview: UIView,
                                   animated: Bool = true,
                                   duration: TimeInterval = 0.35,
                                   options: UIView.AnimationOptions = [.curveEaseInOut,
                                                                       .transitionCrossDissolve]) {
        addChild(controller)
        controller.view.frame = subview.frame
        controller.view.center = subview.center
        UIView.transition(with: subview,
                          duration: animated ? duration : 0,
                          options: options,
                          animations: {
                            subview.addSubview(controller.view)
        }, completion: nil)

        controller.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controller.view.leftAnchor.constraint(equalTo: subview.leftAnchor),
            controller.view.rightAnchor.constraint(equalTo: subview.rightAnchor),
            controller.view.topAnchor.constraint(equalTo: subview.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: subview.bottomAnchor)])

        controller.didMove(toParent: self)
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }

    public func addChildController(_ child: UIViewController, in containerView: UIView) {
        guard containerView.isDescendant(of: view) else {
            return
        }

        addChild(child)
        containerView.addSubview(child.view)
        child.view.frame = containerView.frame
        child.view.center = containerView.center
        child.view.addConstraints()
        child.view.setNeedsLayout()
        child.view.layoutIfNeeded()
        child.didMove(toParent: self)
    }

    public func removeChildController(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }

}

#endif
