//
//  Created by Tom Baranes on 11/04/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import XCTest

final class UIAlertControllerExtensionTests: XCTestCase {

}

// MARK: - Init

extension UIAlertControllerExtensionTests {

    func testInit() {
        let alertController = UIAlertController(title: "Title",
                                                message: "Message",
                                                defaultActionButtonTitle: "Cancel",
                                                defaultActionButtonStyle: .cancel,
                                                tintColor: .blue)
        XCTAssertNotNil(alertController)
        XCTAssertEqual(alertController.title, "Title")
        XCTAssertEqual(alertController.message, "Message")
        XCTAssertEqual(alertController.view.tintColor, .blue)
        XCTAssert(alertController.actions.count == 1)

        let defaultAction = alertController.actions.first
        XCTAssertEqual(defaultAction?.title, "Cancel")
        XCTAssertEqual(defaultAction?.style, .cancel)
    }

}

// MARK: - Action

extension UIAlertControllerExtensionTests {

    func testAddAction() {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        let discardedResult = alertController.addAction(title: "ActionTitle",
                                                        style: .destructive,
                                                        isEnabled: false,
                                                        handler: nil)
        XCTAssertNotNil(discardedResult)
        XCTAssert(alertController.actions.count == 1)

        let action = alertController.actions.first
        XCTAssertEqual(action?.title, "ActionTitle")
        XCTAssertEqual(action?.style, .destructive)
        XCTAssertEqual(action?.isEnabled, false)
    }

}
