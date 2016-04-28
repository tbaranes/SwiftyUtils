//
//  VariousDataViewController.swift
//  SwiftyUtilsDemo
//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

class OthersExampleViewController: UIViewController {

    // fromNib
    // NSMutableAttributedstring
    
    @IBOutlet weak var labelAppVersion: UILabel! {
        didSet {
            labelAppVersion.text = String(format: "App version: %@", NSBundle.mainBundle().appVersion!)
        }
    }
    
    @IBOutlet weak var labelAppBuild: UILabel! {
        didSet {
            labelAppBuild.text = String(format: "App build: %@", NSBundle.mainBundle().appBuild!)
        }
    }
    
    @IBOutlet weak var labelScreenOrientation: UILabel! {
        didSet {
            labelScreenOrientation.text = String(format: "Screen orientation: %@", UIInterfaceOrientationIsPortrait(UIScreen.screenOrientation()) ? "portrait" : "landscape")
        }
    }
    
    @IBOutlet weak var labelScreenSize: UILabel! {
        didSet {
            labelScreenSize.text = String(format: "Screen width: %.f, screen height: %.f", UIScreen.screenSize().width, UIScreen.screenSize().height)
        }
    }
    
    @IBOutlet weak var labelStatusBarHeight: UILabel! {
        didSet {
            labelStatusBarHeight.text = String(format: "Status bar height: %.f", UIScreen.screenStatusBarHeight)
        }
    }
    
    @IBOutlet weak var labelScreenHeightWithoutStatusBar: UILabel! {
        didSet {
            labelScreenHeightWithoutStatusBar.text = String(format: "Screen height without status bar: %.f", UIScreen.screenHeightWithoutStatusBar)
        }
    }
    
    @IBOutlet weak var imageViewWithColor: UIImageView! {
        didSet {
            imageViewWithColor.image = UIImage.imageWithColor(UIColor.orangeColor())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton(tintColor: UIColor.greenColor())
    }
}
