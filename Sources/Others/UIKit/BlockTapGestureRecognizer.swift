//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

public class BlockTapGestureRecognizer: UITapGestureRecognizer {

    private var tapAction: ((UITapGestureRecognizer) -> Void)?

    #if os(iOS)
    public convenience init (numberOfTapsRequired: Int = 1, numberOfTouchesRequired: Int, tapAction: ((UITapGestureRecognizer) -> Void)?) {
        self.init(numberOfTapsRequired: numberOfTapsRequired, tapAction: tapAction)
        self.numberOfTouchesRequired = numberOfTouchesRequired
    }
    #endif

    public convenience init (numberOfTapsRequired: Int = 1, tapAction: ((UITapGestureRecognizer) -> Void)?) {
        self.init()
        self.numberOfTapsRequired = numberOfTapsRequired
        self.tapAction = tapAction
        self.addTarget(self, action: #selector(handleTap(tap:)))
    }

    func handleTap(tap: UITapGestureRecognizer) {
        tapAction?(tap)
    }

}
