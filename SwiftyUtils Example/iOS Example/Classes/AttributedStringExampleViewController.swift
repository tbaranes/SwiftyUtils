//
//  Created by Tom Baranes on 25/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

final class AttributedStringExampleViewController: UIViewController {

    @IBOutlet weak var labelColorizeAfterOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.colored(inText: "hello world",
                                                               color: UIColor.green,
                                                               afterOcurrence: "hello")
            labelColorizeAfterOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelColorizeForEachOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.colored(inText: "hello world",
                                                               color: UIColor.green,
                                                               occurences: "o")
            labelColorizeForEachOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelStrikeAfterOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.struck(inText: "hello world",
                                                              afterOcurrence: "o")
            labelStrikeAfterOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelStrikeForEachOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.struck(inText: "hello world",
                                                              occurences: "o")
            labelStrikeForEachOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelUnderlineAfterOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.struck(inText: "hello world",
                                                              afterOcurrence: "o")
            labelUnderlineAfterOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelUnderlineForEachOccurence: UILabel! {
        didSet {
            let attrString = NSMutableAttributedString.underlined(inText: "hello world",
                                                                  occurences: "o")
            labelUnderlineForEachOccurence.attributedText = attrString
        }
    }

    @IBOutlet weak var labelCombiningAllAttrExample: UILabel! {
        didSet {
            let attrStr = NSMutableAttributedString(string: "hello world")
            attrStr.color(.orange, afterOcurrence: "hello")
            attrStr.color(.green, occurences: "o")
            attrStr.strike(occurences: "o")
            attrStr.color(.red, occurences: "hello")
            attrStr.underline(occurences: "o")
            attrStr.underline(afterOcurrence: "hello")
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
