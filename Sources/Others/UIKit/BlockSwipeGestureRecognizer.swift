//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

public class BlockSwipeGestureRecognizer: UISwipeGestureRecognizer {

    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?

    #if os(iOS)
    public convenience init(numberOfTouchesRequired: Int,
                            direction: UISwipeGestureRecognizerDirection? = nil,
                            swipeAction: ((UISwipeGestureRecognizer) -> Void)?) {
        self.init(direction: direction, swipeAction: swipeAction)
        self.numberOfTouchesRequired = numberOfTouchesRequired
    }
    #endif

    public convenience init(direction: UISwipeGestureRecognizerDirection? = nil,
                            swipeAction: ((UISwipeGestureRecognizer) -> Void)?) {
        self.init()
        if let direction = direction {
            self.direction = direction
        }
        self.swipeAction = swipeAction
        self.addTarget(self, action: #selector(handleSwipe(swipe:)))
    }

    func handleSwipe(swipe: UISwipeGestureRecognizer) {
        swipeAction?(swipe)
    }

}
