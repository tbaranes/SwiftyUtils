//
//  Created by Tom Baranes on 27/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Navigation

extension UIViewController {

    /// Remove all the previous controllers from the navigation.
    /// - Parameter animated: If false, replace the view controllers without any animations,
    ///                       otherwise it will be animated.
    public func removePreviousControllers(animated: Bool = false) {
        navigationController?.setViewControllers([self], animated: animated)
    }

}

// MARK: - Misc

extension UIViewController {

    /// Either the viewcontroller is visible or not.
    public var isVisible: Bool {
        self.isViewLoaded && view.window != nil
    }

    /// Check if the view controller has been presented or not.
    /// - Returns: true if the controller is presented, otherwise false.
    public var isModal: Bool {
        presentingViewController?.presentedViewController == self ||
            navigationController?.presentingViewController?.presentedViewController == navigationController ||
            tabBarController?.presentingViewController is UITabBarController
    }

}

// MARK: - ChildVC

@available(iOS 9.0, *)
extension UIViewController {

    /// Add a child controller the current one.
    /// - Parameters:
    ///   - controller: The controller that will be added as a child.
    ///   - subview: The container view which will contain the child view controller.
    ///   - animated: If true, the addition will be animated.
    ///   - duration: The animation duration, if `animated` is false, that value is not used. Default value is `0.35`.
    ///   - options: The animation's options. If `animated` is false, that value is not used.
    ///             The default value is `[.curveEaseInOut, .transitionCrossDissolve]`.
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

    /// Add a child controller the current one.
    /// - Parameters:
    ///   - child: The controller that will be added as a child.
    ///   - containerView: The container view which will contain the child view controller.
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

    /// Remove a child controller.
    /// - Parameter child: The controller to remove.
    public func removeChildController(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }

}

#endif

#if os(iOS)

import SafariServices

// MARK: - Safari View Controller

@available(iOS 10.0, *)
extension UIViewController {

    /// open Safari view controller with URL and options
    /// - Parameters:
    ///     - url: `URL`
    ///     - delegate: `SFSafariViewControllerDelegate`, you may use `SafariViewControllerDelegate`
    ///     - tintColor: `UIColor`, default is `.black`
    ///     - barTintColor: `UIColor`, default is `.white`
    ///     - barCollapsing: `Bool`, default is `true` only available since iOS 11.0
    public func openSafariVC(withURL url: URL,
                             delegate: SFSafariViewControllerDelegate,
                             tintColor: UIColor = .black,
                             barTintColor: UIColor = .white,
                             barCollapsing: Bool = true) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = delegate
        safariViewController.preferredControlTintColor = tintColor
        safariViewController.preferredBarTintColor = barTintColor
        if #available(iOS 11.0, *) {
            safariViewController.configuration.barCollapsingEnabled = barCollapsing
        }
        DispatchQueue.main.async { [weak self] in
            self?.present(safariViewController, animated: true, completion: nil)
        }
    }

}

#endif
