//
//  UIViewControllerTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 11/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest

// MARK: Life cycle

final class UIViewControllerExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Remove

extension UIViewControllerExtensionTests {

    func testRemovePreviousControllers() {
        let navController = UINavigationController()
        let lastVC = UIViewController()
        navController.pushViewController(UIViewController(), animated: true)
        navController.pushViewController(UIViewController(), animated: true)
        navController.pushViewController(lastVC, animated: true)
        lastVC.removePreviousControllers()
        XCTAssertEqual(navController.viewControllers.count, 1)
    }

}

// MARK: - Misc

extension UIViewControllerExtensionTests {

    func testIsVisible() {
        let viewController = UIViewController()
        XCTAssertFalse(viewController.isVisible)
    }

}

// MARK: - Modal

extension UIViewControllerExtensionTests {

    func testIsModal_false() {
        let vc = UIViewController()
        _ = UINavigationController(rootViewController: vc)
        XCTAssertFalse(vc.isModal)
    }

    func testIsModal_true() {
        let vc = UIViewController()
        let vcModal = UIViewController()
        vc.present(vcModal, animated: false, completion: nil)
        XCTAssertTrue(vcModal.isModal)
    }

    func testIsModal_embedNav_true() {
        let vc = UIViewController()
        let navController = UINavigationController(rootViewController: vc)
        navController.pushViewController(vc, animated: true)

        let vcModal = UIViewController()
        navController.present(vcModal, animated: false, completion: nil)
        XCTAssertTrue(vcModal.isModal)
    }

}
