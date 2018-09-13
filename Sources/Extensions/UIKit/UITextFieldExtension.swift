//
//  Created by Tom Baranes on 18/01/2017.
//  Copyright © 2017 Tom Baranes. All rights reserved.
//

import UIKit

// MARK: - Clear button

extension UITextField {

    public func setClearButton(with image: UIImage) {
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(image, for: .normal)
        clearButton.frame = CGRect(origin: .zero, size: CGSize(width: self.height, height: self.height))
        clearButton.contentMode = .right
        clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        clearButtonMode = .never

        rightView = clearButton
        rightViewMode = .whileEditing
    }

    @objc
    func clear() {
        text = ""
        sendActions(for: .editingChanged)
    }

}

// MARK: - Placeholder

public extension UITextField {

    public func setPlaceHolderTextColor(_ color: UIColor) {
        guard let placeholder = placeholder, placeholder.isNotEmpty else {
            return
        }
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: attributes)
    }

}
