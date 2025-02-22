//
//  UIView+Extensions.swift
//  Watch
//
//  Created by grape on 2/22/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}


