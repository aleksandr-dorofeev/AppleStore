//
//  ImageView+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 12.10.2022.
//

import UIKit

/// Extension for resize image.
extension UIImage {
  func resizeImage(to size: CGSize) -> UIImage {
    UIGraphicsImageRenderer(size: size).image { _ in
      draw(in: CGRect(origin: .zero, size: size))
    }
  }
}
