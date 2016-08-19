//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

class InjectableViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton(title: "Custom back title!", tintColor: UIColor.blue)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let injectedVC = segue.destination as? InjectedViewController,
            segue.identifier == "Push using injectable example" {
            injectedVC.inject(properties: textField.text ?? "")
        }
    }

}
