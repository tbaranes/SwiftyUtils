
//
//  AttributedStringExampleViewController.swift
//  SwiftyUtilsDemo
//
//  Created by Tom Baranes on 25/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

class AttributedStringExampleViewController: UIViewController {

    @IBOutlet weak var labelColorizeAfterOccurence: UILabel! {
        didSet {
            labelColorizeAfterOccurence.attributedText = NSMutableAttributedString.setTextColor(text: "hello world", color: UIColor.green(), afterOcurrence: "hello")
        }
    }
    
    @IBOutlet weak var labelColorizeForEachOccurence: UILabel! {
        didSet {
            labelColorizeForEachOccurence.attributedText = NSMutableAttributedString.setTextColor(text: "hello world", color: UIColor.green(), forOccurences: "o")
        }
    }
    
    @IBOutlet weak var labelStrikeAfterOccurence: UILabel! {
        didSet {
            labelStrikeAfterOccurence.attributedText = NSMutableAttributedString.setTextStrike(text: "hello world", afterOcurrence: "o")
        }
    }
    
    @IBOutlet weak var labelStrikeForEachOccurence: UILabel! {
        didSet {
            labelStrikeForEachOccurence.attributedText = NSMutableAttributedString.setTextStrike(text: "hello world", forOccurences: "o")
        }
    }
    
    @IBOutlet weak var labelUnderlineAfterOccurence: UILabel! {
        didSet {
            labelUnderlineAfterOccurence.attributedText = NSMutableAttributedString.setTextUnderline(text: "hello world", afterOcurrence: "o")
        }
    }
    
    @IBOutlet weak var labelUnderlineForEachOccurence: UILabel! {
        didSet {
            labelUnderlineForEachOccurence.attributedText = NSMutableAttributedString.setTextUnderline(text: "hello world", forOccurences: "o")
        }
    }
    
    @IBOutlet weak var labelCombiningAllAttrExample: UILabel! {
        didSet {
            let attrStr = NSMutableAttributedString(string: "hello world")
            attrStr.setTextColor(color: UIColor.orange(), afterOcurrence: "hello")
            attrStr.setTextColor(color: UIColor.green(), forOccurences: "o")
            attrStr.setTextStrike(forOccurences: "o")
            attrStr.setTextStrike(afterOcurrence: "hello")
            attrStr.setTextUnderline(forOccurences: "o")
            attrStr.setTextUnderline(afterOcurrence: "hello")
            labelCombiningAllAttrExample.attributedText = attrStr
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
