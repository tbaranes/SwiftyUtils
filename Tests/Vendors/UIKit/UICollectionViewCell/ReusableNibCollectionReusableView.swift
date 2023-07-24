//
//  ReusableNibCollectionViewCell.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 01/07/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

#if os(iOS)
import UIKit
import SwiftyUtils

final class ReusableNibCollectionReusableView: UICollectionReusableView, NibReusable {

    @IBOutlet private(set) weak var label: UILabel!
}
#endif
