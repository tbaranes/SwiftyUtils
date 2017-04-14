//
//  Created by Tom Baranes on 23/06/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit

extension UIStoryboard {

    public class var main: UIStoryboard? {
        let bundle = Bundle.main
        guard let storyboardName = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else {
            return nil
        }
        return  UIStoryboard(name: storyboardName, bundle: bundle)
    }

}
