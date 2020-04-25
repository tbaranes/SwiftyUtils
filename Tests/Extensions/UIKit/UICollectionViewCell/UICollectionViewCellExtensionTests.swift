//
//  UICollectionViewCellExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import UIKit
import XCTest

final class UICollectionViewCellExtensionTests: XCTestCase {

}

// MARK: - Corner Radius

extension UICollectionViewCellExtensionTests {

    @available(tvOS 11.0, *)
    func testApplyCornerRadius() {
        let cell = UICollectionViewCell()
        cell.applyCornerRadius(10)
        XCTAssertEqual(cell.contentView.layer.cornerRadius, 10)
        XCTAssertTrue(cell.contentView.layer.masksToBounds)
    }

}
