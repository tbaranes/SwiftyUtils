//
//  UICollectionViewExtensionTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if os(iOS)
import UIKit
import XCTest
import SwiftyUtils

final class UICollectionViewExtensionTests: XCTestCase {

     // MARK: Properties

    var collectionView: UICollectionView!
    let indexPath = IndexPath(row: 0, section: 1)

    // MARK: Life Cycle

    override func setUp() {
        super.setUp()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - UICollectionViewDataSource

extension UICollectionViewExtensionTests: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }

}

// MARK: - Register and Dequeue Cells

extension UICollectionViewExtensionTests {

    func testRegister_thenDequeueReusableCell_withClass() {
        collectionView.register(cellType: ReusableClassCollectionViewCell.self)
        let cell: ReusableClassCollectionViewCell = collectionView.dequeueReusableCell(at: indexPath)
        XCTAssertNotNil(cell)
    }

    func testRegister_thenDequeueReusableCell_withNib() {
        collectionView.register(cellType: ReusableNibCollectionViewCell.self)
        let cell: ReusableNibCollectionViewCell = collectionView.dequeueReusableCell(at: indexPath)
        XCTAssertNotNil(cell)
    }

}
#endif
