//
//  NSMutableAttributedString+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 10.10.2022.
//

import UIKit

/// Extension for make text in label multicolor.
extension NSMutableAttributedString {
  
  // MARK: - Public Visual components.
  func setColorForText(textForAttribute: String,
                       withColor color: UIColor) {
    let range: NSRange = mutableString.range(of: textForAttribute,
                                             options: .caseInsensitive)
    addAttribute(NSAttributedString.Key.foregroundColor,
                 value: color,
                 range: range)
  }
}
