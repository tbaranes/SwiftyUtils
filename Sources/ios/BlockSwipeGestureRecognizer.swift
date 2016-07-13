//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

public class BlockSwipeGestureRecognizer: UISwipeGestureRecognizer {

    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?

    public  convenience init (numberOfTouchesRequired: Int = 1, swipeAction: ((UISwipeGestureRecognizer) -> Void)?) {
        self.init()
        self.numberOfTouchesRequired = numberOfTouchesRequired
        self.swipeAction = swipeAction
        self.addTarget(self, action: #selector(handleSwipe(swipe:)))
    }

    public  convenience init (numberOfTouchesRequired: Int = 1, direction: UISwipeGestureRecognizerDirection, swipeAction: ((UISwipeGestureRecognizer) -> Void)?) {
        self.init()
        self.numberOfTouchesRequired = numberOfTouchesRequired
        self.direction = direction
        self.swipeAction = swipeAction
        self.addTarget(self, action: #selector(handleSwipe(swipe:)))
    }

    func handleSwipe(swipe: UISwipeGestureRecognizer) {
        swipeAction?(swipe)
    }

}
