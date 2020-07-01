//
//  NibLoadableView.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

final class NibLoadableView: UIView, NibLoadable {

    @IBOutlet private(set) var label: UILabel!
    @IBOutlet private(set) var nibOwnerLoadableView: NibOwnerLoadableView!

}
