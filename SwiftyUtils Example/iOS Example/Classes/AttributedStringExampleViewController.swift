//
//  Created by Tom Baranes on 25/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

final class AttributedStringExampleViewController: UIViewController {

    @IBOutlet weak var labelColorizeAfterOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.colored(text: "hello world",
                                                   color: UIColor.green,
                                                   afterOcurrence: "hello")
            labelColorizeAfterOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelColorizeForEachOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.colored(text: "hello world",
                                                                    color: UIColor.green,
                                                                    forOccurences: "o")
            labelColorizeForEachOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelStrikeAfterOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.striked(text: "hello world",
                                                                     afterOcurrence: "o")
            labelStrikeAfterOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelStrikeForEachOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.striked(text: "hello world",
                                                                     forOccurences: "o")
            labelStrikeForEachOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelUnderlineAfterOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.striked(text: "hello world",
                                                                        afterOcurrence: "o")
            labelUnderlineAfterOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelUnderlineForEachOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.underlined(text: "hello world",
                                                                        forOccurences: "o")
            labelUnderlineForEachOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelCombiningAllAttrExample: UILabel! {
        didSet {
            let attrStr = NSMutableAttributedString(string: "hello world")
            attrStr.setTextColor(UIColor.orange, afterOcurrence: "hello")
            attrStr.setTextColor(UIColor.green, forOccurences: "o")
            attrStr.setTextStrike(forOccurences: "o")
            attrStr.setTextStrike(afterOcurrence: "hello")
            attrStr.setTextUnderline(forOccurences: "o")
            attrStr.setTextUnderline(afterOcurrence: "hello")
            labelCombiningAllAttrExample.attributedText = attrStr
        }
    }

    @IBOutlet weak var labelLineHeight: UILabel! {
        didSet {
            labelLineHeight.text = "Label with a loooooooong text, and only 0.9 as line height"
            labelLineHeight.setLineHeight(0.9)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
