//
//  UICollectionViewExtension.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if canImport(UIKit)
import UIKit

// MARK: - Registering and Dequeue UICollectionViewCell

extension UICollectionView {

    /// Register a nib-based `UICollectionViewCell` conforming to `Reusable` & `NibLoadable`.
    /// - Parameter cellType: the `UICollectionViewCell`  to register.
    public func register<T: UICollectionViewCell>(cellType: T.Type) where T: Reusable & NibLoadable {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Register a class-based `UICollectionViewCell` conforming to `Reusable`.
    /// - Parameter cellType: The `UICollectionViewCell`  to register.
    public func register<T: UICollectionViewCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Dequeue a reusable `UICollectionViewCell` instance.
    /// - Parameters:
    ///  - indexPath: The index path specifying the location of the cell.
    ///  - cellType: The cell type to dequeue.
    /// - Returns: An `UICollectionViewCell` instance
    public func dequeueReusableCell<T: UICollectionViewCell>(at indexPath: IndexPath,
                                                             cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier,
                                                  for: indexPath) as? T else {
            fatalError("Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) "
                        + "matching type \(cellType.self).")
        }
        return cell
    }

}

// MARK: - Registering and Dequeue UICollectionReusableView

extension UICollectionView {

    /// Register a nib-Based `UICollectionReusableView` conforming to `Reusable` & `NibLoadable`.
    /// - Parameters:
    ///  - headerFooterViewType: The `UICollectionReusableView` to register.
    ///  - elementKind: The kind of supplementary view to create.
    public func register<T: UICollectionReusableView>(supplementaryViewType: T.Type,
                                                      ofKind elementKind: String) where T: Reusable & NibLoadable {
        register(supplementaryViewType.nib,
                 forSupplementaryViewOfKind: elementKind,
                 withReuseIdentifier: supplementaryViewType.reuseIdentifier
        )
    }

    /// Register a class-Based `UICollectionReusableView` conforming to `Reusable` & `NibLoadable`.
    /// - Parameters:
    ///  - supplementaryViewType: The `UIView` subclass to register as `Supplementary View`.
    ///  - elementKind: The kind of supplementary view to create.
    public func register<T: UICollectionReusableView>(supplementaryViewType: T.Type,
                                                      ofKind elementKind: String) where T: Reusable {
        register(supplementaryViewType.self,
                 forSupplementaryViewOfKind: elementKind,
                 withReuseIdentifier: supplementaryViewType.reuseIdentifier)
    }

    /// Dequeue a reusable `UICollectionViewCell` instance.
    /// - parameters:
    ///  - elementKind: The kind of supplementary view to retrieve.
    ///  - indexPath: The index path specifying the location of the cell.
    ///  - viewType: The view class to dequeue.
    /// - Returns: An `UICollectionReusableView` instance.
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String,
                                                                              at indexPath: IndexPath,
                                                                              viewType: T.Type = T.self)
                                                                              -> T where T: Reusable {
        let view = dequeueReusableSupplementaryView(ofKind: elementKind,
                                                    withReuseIdentifier: viewType.reuseIdentifier,
                                                    for: indexPath)
        guard let typedView = view as? T else {
            fatalError("Failed to dequeue a supplementary view with identifier \(viewType.reuseIdentifier) "
                        + "matching type \(viewType.self).")
        }
        return typedView
    }

}
#endif
