//
//  NibOwnerLoadableView.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if os(iOS)
import UIKit
import SwiftyUtils

final class NibOwnerLoadableView: UIView, NibOwnerLoadable {

    @IBOutlet private(set) var label: UILabel!

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.loadNibContent()
    }

}
#endif
