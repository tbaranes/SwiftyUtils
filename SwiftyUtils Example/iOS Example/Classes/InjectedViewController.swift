//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

final class InjectedViewController: UIViewController, Injectable {

    // MARK: Properties

    @IBOutlet private weak var labelStringInjected: UILabel!
    private var stringInjected: String?

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        assertDependencies()
        labelStringInjected.text = "String injected: \(String(describing: stringInjected))"
    }

}

// MARK: - Injectable

extension InjectedViewController {

    typealias T = String

    func inject(properties: T) {
        stringInjected = properties
    }

    func assertDependencies() {
        assert(stringInjected != nil)
    }

}
