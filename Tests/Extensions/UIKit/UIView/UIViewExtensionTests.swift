//
//  UIViewExtensionTests.swift
//  SwiftyUtils
//
//  Created by Mulang Su on 12/01/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

#if os(iOS)
import XCTest

final class UIViewExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Frame

extension UIViewExtensionTests {

    func testXYWHChanges() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.x = 10
        XCTAssertEqual(view.x, 10)
        view.y = 20
        XCTAssertEqual(view.y, 20)
        view.width = 30
        view.height = 40
        XCTAssertEqual(view.frame, CGRect(x: 10, y: 20, width: 30, height: 40))
    }

}

// MARK: - Corner Radius

@available(iOS 11.0, tvOS 11.0, *)
extension UIViewExtensionTests {

    func testConfigureCornerRadius() {
        let view = UIView(frame: .zero)
        view.applyCornerRadius(10)
        XCTAssertEqual(view.layer.cornerRadius, 10)
        XCTAssertTrue(view.layer.masksToBounds)
        XCTAssertEqual(view.layer.maskedCorners, [.layerMaxXMaxYCorner,
                                                  .layerMaxXMinYCorner,
                                                  .layerMinXMaxYCorner,
                                                  .layerMinXMinYCorner])
    }

    func testConfigureCornerRadius_andMaskedCorners() {
        let view = UIView(frame: .zero)
        view.applyCornerRadius(20, maskedCorners: [.layerMaxXMaxYCorner])
        XCTAssertEqual(view.layer.cornerRadius, 20)
        XCTAssertTrue(view.layer.masksToBounds)
        XCTAssertEqual(view.layer.maskedCorners, [.layerMaxXMaxYCorner])
    }

}

// MARK: - Constraints

extension UIViewExtensionTests {

    func testAddConstraints() {
        let view = UIView(frame: .zero)
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        superview.addSubview(view)
        view.addConstraints(to: .all)
        XCTAssertEqual(superview.constraints.count, 4)
    }

    func testAddTopConstraint_withInsets() {
        let view = UIView(frame: .zero)
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        superview.addSubview(view)
        view.addConstraints(to: .top, insets: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertEqual(superview.constraints.first?.constant, 10)
    }

    func testAddLeftConstraint_withInsets() {
        let view = UIView(frame: .zero)
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        superview.addSubview(view)
        view.addConstraints(to: .left, insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertEqual(superview.constraints.first?.constant, 10)
    }

    func testAddBottomConstraint_withInsets() {
        let view = UIView(frame: .zero)
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        superview.addSubview(view)
        view.addConstraints(to: .bottom, insets: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertEqual(superview.constraints.first?.constant, -10)
    }

    func testAddRightConstraint_withInsets() {
        let view = UIView(frame: .zero)
        let superview = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        superview.addSubview(view)
        view.addConstraints(to: .right, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
        XCTAssertEqual(superview.constraints.count, 1)
        XCTAssertEqual(superview.constraints.first?.constant, -10)
    }

}

// MARK: - Find

extension UIViewExtensionTests {
    func testParentViewController() {
        let view = UIView(frame: .zero)
        XCTAssertNil(view.parentViewController)

        let viewController = UIViewController()
        viewController.view.addSubview(view)
        XCTAssertEqual(view.parentViewController, viewController)
    }

    func testFindView() {
        let view = UIView(frame: .zero)
        let viewToFind = UIScrollView()
        view.addSubview(viewToFind)
        view.addSubview(UIView())
        view.addSubview(UIScrollView())

        let scrollView: UIScrollView? = view.findView()
        XCTAssertEqual(scrollView, viewToFind)
    }

    func testFindView_inStackView() {
        let view = UIView(frame: .zero)
        let viewToFind = UIScrollView()
        let stackView = UIStackView(frame: .zero)
        stackView.addArrangedSubview(viewToFind)
        view.addSubview(viewToFind)

        let scrollView: UIScrollView? = view.findView()
        XCTAssertEqual(scrollView, viewToFind)
    }

    func testFindView_forIdentifier() {
        let view = UIView(frame: .zero)
        let viewToFind = UIScrollView()
        viewToFind.accessibilityIdentifier = "accessibilityIdentifier"
        view.addSubview(viewToFind)
        view.addSubview(UIView())
        view.addSubview(UIScrollView())

        let scrollView = view.findView(forIdentifier: "accessibilityIdentifier")
        XCTAssertEqual(scrollView, viewToFind)
    }

    func testFindView__forIdentifier_inStackView() {
        let view = UIView(frame: .zero)
        let viewToFind = UIScrollView()
        viewToFind.accessibilityIdentifier = "accessibilityIdentifier"
        let stackView = UIStackView(frame: .zero)
        stackView.addArrangedSubview(viewToFind)
        view.addSubview(viewToFind)

        let scrollView = view.findView(forIdentifier: "accessibilityIdentifier")
        XCTAssertEqual(scrollView, viewToFind)
    }
}
#endif

// MARK: - SwiftUI

#if canImport(SwiftUI) && (arch(arm64) || arch(x86_64)) && os(iOS)
import SwiftUI

@available(iOS 13.0, tvOS 13.0, *)
extension UIViewExtensionTests {
    struct SwiftUIView: View {
        var body: some View { EmptyView() }
    }

    func testAddSubSwiftUIView() {
        let view = UIView(frame: .zero)
        view.addSubSwiftUIView(SwiftUIView())
        let hostingView = view.subviews.first
        XCTAssertEqual(hostingView?.backgroundColor, .clear)
        XCTAssertEqual(view.constraints.count, 4)
        XCTAssertTrue(hostingView?.parentViewController is UIHostingController<SwiftUIView>)
    }
}

#endif
