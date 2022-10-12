//
//  NavigationController+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 11.10.2022.
//

import UIKit

/// Extension with add bottom line to navigation.
extension UINavigationController {
  
  // MARK: - Private Constants.
  private enum Constants {
    static let hideShadowKey = "hidesShadow"
  }
  
  // MARK: - Public methods.
  func addCustomBottomLine(color: UIColor, height: Double) {
    navigationBar.setValue(true, forKey: Constants.hideShadowKey)
    
    let lineView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: height))
    lineView.backgroundColor = color
    navigationBar.addSubview(lineView)
    
    lineView.translatesAutoresizingMaskIntoConstraints = false
    lineView.widthAnchor.constraint(equalTo: navigationBar.widthAnchor).isActive = true
    lineView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
    lineView.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
    lineView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
  }
}
