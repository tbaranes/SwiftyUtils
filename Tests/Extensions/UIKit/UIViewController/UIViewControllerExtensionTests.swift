//
//  UIViewControllerTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 11/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest
#if canImport(SwiftUI)
import SwiftUI
#endif

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

// MARK: - SwiftUI

@available(iOS 13.0, tvOS 13.0, *)
extension UIViewControllerExtensionTests {
    struct SwiftUIView: View {
        var body: some View { EmptyView() }
    }

    func testAddSubSwiftUIView() {
        let viewController = UIViewController()
        let view = viewController.view
        viewController.addSubSwiftUIView(SwiftUIView(), to: viewController.view)

        let hostingController = viewController.children.first
        XCTAssertEqual(viewController.children.count, 1)
        XCTAssertTrue(hostingController is UIHostingController<SwiftUIView>)

        let hostingView = view?.subviews.first
        XCTAssertEqual(hostingView?.backgroundColor, .clear)
        XCTAssertEqual(view?.constraints.count, 4)
        XCTAssertTrue(hostingView?.parentViewController is UIHostingController<SwiftUIView>)
    }
}
