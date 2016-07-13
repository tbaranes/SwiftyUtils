//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public struct Async {

    public static func background(closure: () -> Void) {
        DispatchQueue(label: "com.swiftyutils.background").async(execute: closure)
    }

    public static func main(closure: () -> Void) {
        DispatchQueue(label: "com.swiftyutils.main").async(execute: closure)
    }

    public static func delay(delay: Double, closure: () -> Void) {
        DispatchQueue(label: "com.swiftyutils.delay").after(when: DispatchTime.now() + delay, execute: closure)
    }

}
