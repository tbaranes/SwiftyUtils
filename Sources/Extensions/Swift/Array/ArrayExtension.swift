//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Subscript

extension Array {

    /// An subscript to access at an index safely.
    /// - Parameter index: The element index that we want to get.
    /// - Returns: The element found at the index, if the index is out of bounds then it will return nil.
    public subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }

}

// MARK: - Remove

extension Array where Element: Equatable {

    /// Remove all duplicates elements in the Array.
    public mutating func removeDuplicates() {
        // swiftlint:disable:next reduce_into
        self = reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }

    /// Remove all duplicates elements in the Array.
    /// - Returns: The array without the duplicates element.
    public func removedDuplicates() -> [Element] {
        // swiftlint:disable:next reduce_into
        return reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }

}

// MARK: - Index Getter

extension Array where Element: Equatable {

    /// Get all the indexes of a specified element.
    /// - Parameter item: The specified element to search for.
    /// - Returns: An array containing all the indexes found for the specified element.
    public func indexes(of item: Element) -> [Int] {
        var indexes = [Int]()
        for index in 0..<count where self[index] == item {
            indexes.append(index)
        }
        return indexes
    }

    /// Get the first index of a specified element.
    /// - Parameter item: The specified element to search for.
    /// - Returns: The index corresponding at the first occurrence of a specified element.
    ///            If no element found, then it will return nil.
    public func firstIndex(of item: Element) -> Int? {
        for (index, value) in lazy.enumerated() where value == item {
            return index
        }
        return nil
    }

    /// Get the last index of a specified element.
    /// - Parameter item: The specified element to search for.
    /// - Returns: The index corresponding at the last occurrence of a specified element.
    ///            If no element found, then it will return nil.
    public func lastIndex(of item: Element) -> Int? {
        indexes(of: item).last
    }

}

// MARK: - Equatable Transform

extension Array where Element: Equatable {

    /// Get all the elements diffing between this array and others.
    /// - Parameter values: All the arrays that will be compared with the current one.
    /// - Returns: An array containing all the elements diffing between this array and the others.
    public func difference(with values: [Element]...) -> [Element] {
        var result = [Element]()
        elements: for element in self {
            for value in values {
                if value.contains(element) {
                    continue elements
                }
            }
            result.append(element)
        }
        return result
    }

    /// Computes the intersection of arrays.
    /// - Parameter values: all the array that will be intersected with this one.
    /// - Returns: An array containing all the values of this array that are present in all the arguments.
    public func intersection(for values: [Element]...) -> Array {
        var result = self
        var intersection = Array()

        for (index, value) in values.enumerated() {
            if index > 0 {
                result = intersection
                intersection = Array()
            }

            value.forEach {
                if result.contains($0) {
                    intersection.append($0)
                }
            }
        }
        return intersection
    }

    /// Add each array's unique elements in this one.
    /// - Parameter values: all the array that will be merged in this one.
    /// - Returns: An array containing all the values of this array plus all the unique ones from the others array.
    public func union(values: [Element]...) -> Array {
        var result = self
        for array in values {
            for value in array {
                if !result.contains(value) {
                    result.append(value)
                }
            }
        }
        return result
    }

    /// Split the array in several subarrays of a specified size.
    /// - Parameter chunkSize: The size of each subarray.
    /// - Returns: An array containing others arrays containing a maximum of `chunkSize`.
    public func split(intoChunksOf chunkSize: Int) -> [[Element]] {
        stride(from: 0, to: self.count, by: chunkSize).map {
            let endIndex = ($0.advanced(by: chunkSize) > self.count) ? self.count - $0 : chunkSize
            return Array(self[$0..<$0.advanced(by: endIndex)])
        }
    }

}
