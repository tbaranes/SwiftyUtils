//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

final class OthersExampleViewController: UIViewController {

    // fromNib
    // NSMutableAttributedstring

    @IBOutlet weak var labelAppVersion: UILabel! {
        didSet {
            labelAppVersion.text = String(format: "App version: %@", Bundle.main.appVersion)
        }
    }

    @IBOutlet weak var labelAppBuild: UILabel! {
        didSet {
            labelAppBuild.text = String(format: "App build: %@", Bundle.main.appBuild)
        }
    }

    @IBOutlet weak var labelScreenOrientation: UILabel! {
        didSet {
            let isPortrait = UIInterfaceOrientationIsPortrait(UIScreen.currentOrientation)
            let orientation = isPortrait ? "portrait" : "landscape"
            labelScreenOrientation.text = String(format: "Screen orientation: %@", orientation)

        }
    }

    @IBOutlet weak var labelScreenSize: UILabel! {
        didSet {
            labelScreenSize.text = String(format: "Screen width: %.f, screen height: %.f",
                                          UIScreen.size.width, UIScreen.size.height)
        }
    }

    @IBOutlet weak var labelStatusBarHeight: UILabel! {
        didSet {
            labelStatusBarHeight.text = String(format: "Status bar height: %.f",
                                               UIScreen.statusBarHeight)
        }
    }

    @IBOutlet weak var labelScreenHeightWithoutStatusBar: UILabel! {
        didSet {
            let text = String(format: "Screen height without status bar: %.f",
                              UIScreen.heightWithoutStatusBar)
            labelScreenHeightWithoutStatusBar.text = text
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton(tintColor: UIColor.green)
    }
}
