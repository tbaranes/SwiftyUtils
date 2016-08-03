//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

public extension UIScreen {

    public static func screenOrientation() -> UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }

    public static func screenSize() -> CGSize {
        return CGSize(width: screenWidth, height: screenHeight)
    }

    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }

    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }

    public static var screenStatusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }

    public static var screenHeightWithoutStatusBar: CGFloat {
        return UIInterfaceOrientationIsPortrait(screenOrientation()) ? UIScreen.main.bounds.size.height - screenStatusBarHeight :
            UIScreen.main.bounds.size.width - screenStatusBarHeight
    }

}
