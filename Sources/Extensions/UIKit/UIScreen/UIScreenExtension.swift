//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

// MARK: - Size

extension UIScreen {

    @objc public class var size: CGSize {
        CGSize(width: width, height: height)
    }

    @objc public class var width: CGFloat {
        UIScreen.main.bounds.size.width
    }

    @objc public class var height: CGFloat {
        UIScreen.main.bounds.size.height
    }

}

#if os(iOS)

// MARK: - StatusBar

extension UIScreen {

    public class var statusBarHeight: CGFloat {
        UIApplication.shared.statusBarFrame.height
    }

    public class var heightWithoutStatusBar: CGFloat {
        currentOrientation.isPortrait ? height - statusBarHeight :
            UIScreen.main.bounds.size.width - statusBarHeight
    }

}

// MARK: - Orientation

extension UIScreen {

    @objc public class var currentOrientation: UIInterfaceOrientation {
        UIApplication.shared.statusBarOrientation
    }

}
#endif

#endif
