//
//  Created by Tom Baranes on 18/01/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import UIKit

public extension UITextField {

    public func setClearButton(with image: UIImage) {
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(image, for: .normal)
        clearButton.frame = CGRect(origin: .zero, size: image.size)
        clearButton.contentMode = .left
        clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        clearButtonMode = .never

        rightView = clearButton
        rightViewMode = .whileEditing
    }

    func clear() {
        self.text = ""
        self.sendActions(for: .editingChanged)
    }

}
