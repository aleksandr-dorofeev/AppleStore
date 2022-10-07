//
//  View+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 06.10.2022.
//

import UIKit

/// Extension for add border for view.
extension UIView {
  func addBottomBorder() {
       let thickness: CGFloat = 0.4
       let bottomBorder = CALayer()
       bottomBorder.frame = CGRect(x: 0,
                                   y: frame.size.height - thickness,
                                   width: frame.size.width,
                                   height: thickness)
       bottomBorder.backgroundColor = UIColor.darkGray.cgColor
       self.layer.addSublayer(bottomBorder)
     }
}
