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

extension Array where Element : Equatable {

    public mutating func remove(object: Iterator.Element) -> Bool {
        if let index = self.index(of: object) {
            self.remove(at: index)
            return true
        }
        return false
    }

    public mutating func remove(objects: Element) {
        for idx in self.indexes(of: objects).reversed() {
            self.remove(at: idx)
        }
    }

    public mutating func removeDuplicates() {
        self = reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }

    public func removedDuplicates() -> [Element] {
        return reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }

    public mutating func removeAll(_ item: Element) {
        self = filter { $0 != item }
    }

    public mutating func removedAll(_ item: Element) -> [Element] {
        return filter { $0 != item }
    }

}

// MARK: - Getter

extension Array {

    public func random() -> Element? {
        guard isNotEmpty else {
            return nil
        }

        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }

}

// MARK: - Index Getter

extension Array where Element : Equatable {

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

extension Array where Element : Equatable {

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

        for (i, value) in values.enumerated() {
            if i > 0 {
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

// MARK: - Transform

extension Array {

    public func shuffled() -> [Element] {
        var array = self
        array.shuffle()
        return array
    }

    public mutating func shuffle() {
        guard count > 2 else {
            return
        }

        for idx in startIndex..<endIndex {
            let next = Int(arc4random_uniform(UInt32(endIndex - idx))) + idx
            guard idx != next else {
                continue
            }
            self.swapAt(idx, next)
        }
    }

}

// MARK: - Misc

extension Array {

    public func testAll(test: (Element) -> Bool) -> Bool {
        for item in self {
            if !test(item) {
                return false
            }
        }
        return true
    }

}

// MARK: - Misc Equatable

extension Array where Element : Equatable {

    public func contains(_ elements: [Element]) -> Bool {
        for item in elements {
            if contains(item) == false {
                return false
            }
        }
        return true
    }

}
