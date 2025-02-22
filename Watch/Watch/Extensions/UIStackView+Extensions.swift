//
//  UIStackView+Extensions.swift
//  Watch
//
//  Created by grape on 2/22/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
