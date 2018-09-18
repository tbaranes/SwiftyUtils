//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - Subscript

extension Array {

    public subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

}

// MARK: - Remove

extension Array where Element: Equatable {

    public mutating func removeDuplicates() {
        self = reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }

    public func removedDuplicates() -> [Element] {
        return reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }

}

// MARK: - Index Getter

extension Array where Element: Equatable {

    public func indexes(of item: Element) -> [Int] {
        var indexes = [Int]()
        for index in 0..<count where self[index] == item {
            indexes.append(index)
        }
        return indexes
    }

    public func firstIndex(of item: Element) -> Int? {
        for (index, value) in lazy.enumerated() where value == item {
            return index
        }
        return nil
    }

    public func lastIndex(of item: Element) -> Int? {
        return indexes(of: item).last
    }

}

// MARK: - Equatable Transform

extension Array where Element: Equatable {

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

    public func split(intoChunksOf chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            let endIndex = ($0.advanced(by: chunkSize) > self.count) ? self.count - $0 : chunkSize
            return Array(self[$0..<$0.advanced(by: endIndex)])
        }
    }

}
