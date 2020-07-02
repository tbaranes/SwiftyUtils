//
//  UITableViewCell.swift
//  SwiftyUtils iOS
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if canImport(UIKit)
import UIKit

// MARK: - Registering and Dequeue UITableViewCell

extension UITableView {

    /// Register a nib-based `UITableViewCell` conforming to `Reusable` & `NibLoadable`.
    /// - Parameter cellType: the `UITableViewCell`  to register.
    public func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable & NibLoadable {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Register a class-based `UITableViewCell` conforming to `Reusable`.
    /// - Parameter cellType: The `UITableViewCell`  to register.
    public func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Dequeue a reusable `UITableViewCell` instance.
    /// - Parameters:
    ///  - indexPath: The index path specifying the location of the cell.
    ///  - cellType: The cell type to dequeue.
    /// - Returns: An `UITableViewCell` instance
    public func dequeueReusableCell<T: UITableViewCell>(at indexPath: IndexPath,
                                                        cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier,
                                                  for: indexPath) as? T else {
            fatalError("Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) "
                       + "matching type \(cellType.self).")
        }
        return cell
    }

}

// MARK: - Registering and Dequeue UITableViewHeaderFooterView

extension UITableView {

    /// Register a nib-Based `UITableViewHeaderFooterView` conforming to `Reusable` & `NibLoadable`.
    /// - Parameter headerFooterViewType: The `UITableViewHeaderFooterView` to register.
    public func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type) where T: Reusable & NibLoadable {
        register(headerFooterViewType.nib,
                 forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }

    /// Register a class-Based `UITableViewHeaderFooterView` conforming to `Reusable` & `NibLoadable`.
    /// - Parameter headerFooterViewType: The `UITableViewHeaderFooterView` to register.
    public func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type) where T: Reusable {
        register(headerFooterViewType.self,
                 forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
    }

    /// Dequeue a reusable `UITableViewHeaderFooterView` instance.
    /// - Parameter viewType: The view class to dequeue.
    /// - Returns: An `UITableViewHeaderFooterView` instance.
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewType: T.Type = T.self)
                                                                                -> T where T: Reusable {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T else {
            fatalError("Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) "
                        + "matching type \(viewType.self).")
        }
        return view
    }
}
#endif
