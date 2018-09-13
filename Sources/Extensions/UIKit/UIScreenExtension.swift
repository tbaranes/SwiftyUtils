//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

// MARK: - Size

extension UIScreen {

    @objc public class var size: CGSize {
        return CGSize(width: width, height: height)
    }

    @objc public class var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }

    @objc public class var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }

}

#if os(iOS)

// MARK: - StatusBar

extension UIScreen {

    public class var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }

    public class var heightWithoutStatusBar: CGFloat {
        return currentOrientation.isPortrait ? height - statusBarHeight :
            UIScreen.main.bounds.size.width - statusBarHeight
    }

}

// MARK: - Orientation

extension UIScreen {

    @objc public class var currentOrientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }

}
#endif
