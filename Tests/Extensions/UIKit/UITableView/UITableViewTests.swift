//
//  UITableViewExtensionsTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class UITableViewTests: XCTestCase {

     // MARK: Properties

    let tableView = UITableView()
    let indexPath = IndexPath(row: 0, section: 0)

    // MARK: Life Cycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Register and Dequeue Cells

extension UITableViewTests {

    func testRegister_thenDequeueReusableCell_withClass() {
        tableView.register(cellType: ReusableClassTableViewCell.self)
        let cell: ReusableClassTableViewCell = tableView.dequeueReusableCell(at: indexPath)
        XCTAssertNotNil(cell)
    }

    func testRegister_thenDequeueReusableCell_withNib() {
        tableView.register(cellType: ReusableNibTableViewCell.self)
        let cell: ReusableNibTableViewCell = tableView.dequeueReusableCell(at: indexPath)
        XCTAssertNotNil(cell)
    }

}

// MARK: - Register and Dequeue HeaderFooter

extension UITableViewTests {

    func testRegister_thenDequeueReusableFooter_withClass() {
        tableView.register(headerFooterViewType: ReusableClassHeaderFooterView.self)
        let cell: ReusableClassHeaderFooterView = tableView.dequeueReusableHeaderFooterView()
        XCTAssertNotNil(cell)
    }

    func testDequeueReusableHeaderFooter_withClassForIndexPath() {
        tableView.register(headerFooterViewType: ReusableNibHeaderFooterView.self)
        let cell: ReusableNibHeaderFooterView = tableView.dequeueReusableHeaderFooterView()
        XCTAssertNotNil(cell)
    }

}
