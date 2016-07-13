//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

public class BlockPanGestureRecognizer: UIPanGestureRecognizer {

    private var panAction: ((UIPanGestureRecognizer) -> Void)?

    public  convenience init (minimumNumberOfTouches: Int = 1, panAction: ((UIPanGestureRecognizer) -> Void)?) {
        self.init()
        self.minimumNumberOfTouches = minimumNumberOfTouches
        self.panAction = panAction
        self.addTarget(self, action: #selector(handlePan(pan:)))
    }

    func handlePan(pan: UIPanGestureRecognizer) {
        panAction?(pan)
    }

}
