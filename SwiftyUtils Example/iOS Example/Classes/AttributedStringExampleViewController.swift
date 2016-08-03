//
//  Created by Tom Baranes on 25/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

class AttributedStringExampleViewController: UIViewController {

    @IBOutlet weak var labelColorizeAfterOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.setTextColor(text: "hello world",
                                                   color: UIColor.green,
                                                   afterOcurrence: "hello")
            labelColorizeAfterOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelColorizeForEachOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.setTextColor(text: "hello world",
                                                                    color: UIColor.green,
                                                                    forOccurences: "o")
            labelColorizeForEachOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelStrikeAfterOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.setTextStrike(text: "hello world",
                                                                     afterOcurrence: "o")
            labelStrikeAfterOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelStrikeForEachOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.setTextStrike(text: "hello world",
                                                                     forOccurences: "o")
            labelStrikeForEachOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelUnderlineAfterOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.setTextUnderline(text: "hello world",
                                                                        afterOcurrence: "o")
            labelUnderlineAfterOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelUnderlineForEachOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.setTextUnderline(text: "hello world",
                                                                        forOccurences: "o")
            labelUnderlineForEachOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelCombiningAllAttrExample: UILabel! {
        didSet {
            let attrStr = NSMutableAttributedString(string: "hello world")
            attrStr.setTextColor(color: UIColor.orange, afterOcurrence: "hello")
            attrStr.setTextColor(color: UIColor.green, forOccurences: "o")
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
