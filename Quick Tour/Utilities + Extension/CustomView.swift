//
//  CustomView.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/3/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
//@IBDesignable
class CustomView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
