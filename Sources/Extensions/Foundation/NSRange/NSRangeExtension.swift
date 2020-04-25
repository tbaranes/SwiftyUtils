//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

extension NSRange {

    /// Finds and returns the range of the first occurrence of a given string within the string.
    /// - Parameters:
    ///    - text: The text where the `textToFind` will be searched.
    ///    - occurence: The text will be searched after this specified text.
    /// - Returns: The range corresponding to `textToFind` in `text`.
    ///            If the text has not been found then it will returns `NSNotFound`.
    public init(text: String, afterOccurence occurence: String) {
        self = (text as NSString).range(of: occurence, options: [])
        if location != NSNotFound {
            location += 1
            length = text.count - location
        }
    }

    /// Finds and returns the range of the first occurrence of a given string within the string.
    /// - Parameters:
    ///    - textToFind: The text to search for.
    ///    - text: The text where the `textToFind` will be searched.
    /// - Returns: The range corresponding to `textToFind` in `text`.
    ///            If the text has not been found then it will returns `NSNotFound`.
    public init(textToFind: String, in text: String) {
        self = (text as NSString).range(of: textToFind, options: [])
    }

}
