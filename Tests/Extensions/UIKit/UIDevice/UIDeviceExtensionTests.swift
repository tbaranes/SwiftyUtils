//
//  UIDeviceExtensionTests.swift
//  SwiftyUtils iOS
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if os(iOS)
import UIKit
import XCTest
import SwiftyUtils

// MARK: Life cycle

final class UIDeviceExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Device information

extension UIDeviceExtensionTests {

    func testIdForVendor() {
        XCTAssertNotNil(UIDevice.idForVendor)
    }

     func testSystemName() {
        XCTAssertEqual(UIDevice.systemName(), UIDevice.current.systemName)
    }

    func testSystemVersion() {
        XCTAssertEqual(UIDevice.systemVersion(), UIDevice.current.systemVersion)
    }

     func testDeviceName() {
        XCTAssertEqual(UIDevice.deviceName, UIDevice.current.name)
    }

     func testDeviceLanguage() {
        XCTAssertEqual(UIDevice.deviceLanguage, Bundle.main.preferredLocalizations[0])
    }

     func testIsPhone() {
        XCTAssertEqual(UIDevice.isPhone,
                       UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone)
    }

     func testIsPad() {
        XCTAssertEqual(UIDevice.isPad,
                       UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
    }

}

// MARK: - Version

extension UIDeviceExtensionTests {

    func testIsVersion() {
        XCTAssertTrue(UIDevice.isVersion((UIDevice.current.systemVersion as NSString).floatValue))
    }

    func testIsVersionOrLater() {
        XCTAssertFalse(UIDevice.isVersionOrLater(50))
        XCTAssertTrue(UIDevice.isVersionOrLater(10))
    }

    func testIsVersionOrEarlier() {
        XCTAssertTrue(UIDevice.isVersionOrEarlier(50))
        XCTAssertFalse(UIDevice.isVersionOrEarlier(10))
    }

}
#endif
