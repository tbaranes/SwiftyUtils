//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public protocol Injectable {
    associatedtype T
    func inject(properties: T)
    func assertDependencies()
}
