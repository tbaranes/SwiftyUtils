// File.swift
//
// Copyright (c) 2016 Tom Baranes
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

// MARK: - Delete

public extension Array where Element : Equatable {

    public mutating func removeObject(object : Iterator.Element) -> Bool {
        if let index = self.index(of: object) {
            self.remove(at: index)
            return true
        }
        return false
    }
    
    public mutating func removeObjects(object: Element) {
        for idx in self.indexesOf(object: object).reversed() {
            self.remove(at: idx)
        }
    }

}

// MARK: - Getter

public extension Array {
    
    public func random() -> Element? {
        guard self.count > 0 else {
            return nil
        }
        
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
    public func get(index: Int) -> Element? {
        return index >= 0 && index < count ? self[index] : nil
    }
    
    public func takeMax(n: Int) -> Array {
        return Array(self[0..<Swift.max(0, Swift.min(n, count))])
    }

}

public extension Array where Element : Equatable {
    
    public func indexesOf(object: Element) -> [Int] {
        var indexes = [Int]()
        for index in 0..<self.count {
            if self[index] == object {
                indexes.append(index)
            }
        }
        return indexes
    }

    public func lastIndexOf(object: Element) -> Int? {
        return indexesOf(object: object).last
    }
    
    public func difference(values: [Element]...) -> [Element] {
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

    public func intersection(values: [Element]...) -> Array {
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

}

// MARK: - Update

public extension Array {
    
    public func reverseIndex(index: Int) -> Int {
        return Swift.max(self.count - 1 - index, 0)
    }

}

// MARK: - Helpers

public extension Array {
    
    public func containsInstanceOf<T>(object: T) -> Bool {
        for item in self {
            if item.dynamicType == object.dynamicType {
                return true
            }
        }
        return false
    }
    
    
    public func testAll(test: (Element) -> Bool) -> Bool {
        for item in self {
            if !test(item) {
                return false
            }
        }
        return true
    }
    
}

public extension Array where Element : Equatable {

    public func contains(items: Element...) -> Bool {
        return items.testAll { self.index(of: $0) >= 0 }
    }

    public func containsArray(lookFor: [Element]) -> Bool {
        for item in lookFor {
            if self.contains(item) == false {
                return false
            }
        }
        return true
    }

}
