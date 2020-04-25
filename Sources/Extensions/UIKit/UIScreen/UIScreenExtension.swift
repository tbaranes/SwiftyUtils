//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Size

extension UIScreen {

    /// Get the screen's size.
    @objc public class var size: CGSize {
        CGSize(width: width, height: height)
    }

    /// Get the screen's width.
    @objc public class var width: CGFloat {
        UIScreen.main.bounds.size.width
    }

    /// Get the screen's height..
    @objc public class var height: CGFloat {
        UIScreen.main.bounds.size.height
    }

}

#if os(iOS)

// MARK: - StatusBar

extension UIScreen {

    /// Get the status bar height.
    /// - Returns: The status bar height.
    public class var statusBarHeight: CGFloat {
        UIApplication.shared.statusBarFrame.height
    }

    /// Get the screen height without the status bar.
    public class var heightWithoutStatusBar: CGFloat {
        currentOrientation.isPortrait ? height - statusBarHeight :
            UIScreen.main.bounds.size.width - statusBarHeight
    }

}

// MARK: - Orientation

extension UIScreen {

    /// Get the current screen orientation.
    @objc public class var currentOrientation: UIInterfaceOrientation {
        UIApplication.shared.statusBarOrientation
    }

}
#endif

#endif
