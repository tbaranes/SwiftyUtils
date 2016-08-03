//
//  Created by Tom Baranes on 10/05/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

public extension UIAlertController {

    public static func show(title: String, message: String, cancelTitle: String = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        UIApplication.shared.topViewController()?.present(alertController, animated: true, completion: nil)
    }

}
