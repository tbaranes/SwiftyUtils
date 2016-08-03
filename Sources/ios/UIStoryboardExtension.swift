//
//  Created by Tom Baranes on 23/06/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

public extension UIStoryboard {

    public static var main: UIStoryboard {
        let bundle = Bundle.main
        guard let storyboardName = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else {
            fatalError("No main storyboard set in your app.")
        }
        return  UIStoryboard(name: storyboardName, bundle: bundle)
    }

}
