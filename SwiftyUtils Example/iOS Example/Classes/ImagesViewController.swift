//
//  ImagesViewController.swift
//  iOS Example
//
//  Created by Tom Baranes on 19/08/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

final class ImagesViewController: UIViewController {

    @IBOutlet weak var imageViewWithColor: UIImageView! {
        didSet {
            imageViewWithColor.image = UIImage(color: UIColor.orange)
        }
    }

    @IBOutlet weak var imageFilled: UIImageView! {
        didSet {
            imageFilled.image = imageFilled.image?.filled(with: .green)
        }
    }

    @IBOutlet weak var imageTinted: UIImageView! {
        didSet {
            imageTinted.image = imageTinted.image?.tinted(with: .green)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
