//
//  UIView+Extension.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/18.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

