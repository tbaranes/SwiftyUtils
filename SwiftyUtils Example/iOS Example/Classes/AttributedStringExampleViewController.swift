
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
            labelColorizeAfterOccurence.attributedText = NSMutableAttributedString.setTextColor("hello world", color: UIColor.greenColor(), afterOcurrence: "hello")
        }
    }
    
    @IBOutlet weak var labelColorizeForEachOccurence: UILabel! {
        didSet {
            labelColorizeForEachOccurence.attributedText = NSMutableAttributedString.setTextColor("hello world", color: UIColor.greenColor(), forOccurences: "o")
        }
    }
    
    @IBOutlet weak var labelStrikeAfterOccurence: UILabel! {
        didSet {
            labelStrikeAfterOccurence.attributedText = NSMutableAttributedString.setTextStrike("hello world", afterOcurrence: "o")
        }
    }
    
    @IBOutlet weak var labelStrikeForEachOccurence: UILabel! {
        didSet {
            labelStrikeForEachOccurence.attributedText = NSMutableAttributedString.setTextStrike("hello world", forOccurences: "o")
        }
    }
    
    @IBOutlet weak var labelUnderlineAfterOccurence: UILabel! {
        didSet {
            labelUnderlineAfterOccurence.attributedText = NSMutableAttributedString.setTextUnderline("hello world", afterOcurrence: "o")
        }
    }
    
    @IBOutlet weak var labelUnderlineForEachOccurence: UILabel! {
        didSet {
            labelUnderlineForEachOccurence.attributedText = NSMutableAttributedString.setTextUnderline("hello world", forOccurences: "o")
        }
    }
    
    @IBOutlet weak var labelCombiningAllAttrExample: UILabel! {
        didSet {
            let attrStr = NSMutableAttributedString(string: "hello world")
            attrStr.setTextColor(UIColor.orangeColor(), afterOcurrence: "hello")
            attrStr.setTextColor(UIColor.greenColor(), forOccurences: "o") 
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
