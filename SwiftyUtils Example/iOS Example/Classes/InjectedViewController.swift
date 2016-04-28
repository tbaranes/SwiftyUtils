//
//  InjectedViewController.swift
//  Demo
//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

class InjectedViewController: UIViewController, Injectable {
    
    @IBOutlet weak var labelStringInjected: UILabel!
    private var stringInjected: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()        
        labelStringInjected.text = "String injected: \(stringInjected)"
    }
    
}

// MARK: - Injectable

extension InjectedViewController {
    
    typealias T = String
    
    func inject(properties: T) {
        stringInjected = properties
    }
    
    func assertDependencies() {
        assert(stringInjected != nil)
    }
    
}
