//
//  InjectableViewController.swift
//  Demo
//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

class InjectableViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton(title: "Custom back title!", tintColor: UIColor.blueColor())
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if let injectedVC = segue.destinationViewController as? InjectedViewController where segue.identifier == "Push using injectable example" {
            injectedVC.inject(textField.text ?? "")
        }
    }
    
}