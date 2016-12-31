//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public extension Collection {

    public func shuffled() -> [Generator.Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }

}

public extension MutableCollection where Index == Int {

    public mutating func shuffle() {
        if count < 2 {
            return
        }

        for i in startIndex..<endIndex {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }

}
