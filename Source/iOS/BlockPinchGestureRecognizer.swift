//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

public class BlockPinchGestureRecognizer: UIPinchGestureRecognizer {

    private var pinchAction: ((UIPinchGestureRecognizer) -> Void)?

    public  convenience init (pinchAction: ((UIPinchGestureRecognizer) -> Void)?) {
        self.init()
        self.pinchAction = pinchAction
        self.addTarget(self, action: #selector(handlePinch(pinch:)))
    }

    func handlePinch(pinch: UIPinchGestureRecognizer) {
        pinchAction?(pinch)
    }

}
