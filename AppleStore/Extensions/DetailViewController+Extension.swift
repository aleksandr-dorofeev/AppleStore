//
//  DetailViewController+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 08.10.2022.
//

import UIKit

/// Extension for add UI elements on view.
extension DetailViewController {
  
  // MARK: - Public Visual components.
  func makeColorButton(xCoordinate: Int) -> UIButton {
    let button = UIButton()
    var config = UIButton.Configuration.borderless()
    config.cornerStyle = .capsule
    config.background.strokeColor = .systemBackground
    config.background.strokeWidth = 3
    config.background.backgroundColor = .systemGray
    button.configuration = config
    button.frame = CGRect(x: xCoordinate, y: 450, width: 40, height: 40)
    button.backgroundColor = .clear
    button.layer.shadowOffset = CGSize(width: 0, height: 0)
    button.layer.shadowColor = UIColor.systemBlue.cgColor
    button.layer.shadowRadius = 0
    button.layer.shadowOpacity = 1
    button.addTarget(self, action: #selector(toggleButtonAction), for: .touchUpInside)
    view.addSubview(button)
    return button
  }
  
  func addGradientForButton(button: UIButton) {
    let colorTop = UIColor.systemGray5.cgColor
    let colorBottom = UIColor.systemGray3.cgColor
    let layer = CAGradientLayer()
    var config = button.configuration
    button.layer.insertSublayer(layer, at: 0)
    config?.background.backgroundColor = .clear
    button.configuration = config
    layer.cornerRadius = 20
    layer.masksToBounds = true
    layer.colors = [colorTop, colorBottom]
    layer.locations = [0.0, 1.0]
    layer.frame = button.bounds
  }
  
  // MARK: - Private actions.
  @objc private func toggleButtonAction(sender: UIButton) {
    firstColorButton.layer.shadowRadius = sender === firstColorButton ? 3 : 0
    secondColorButton.layer.shadowRadius = sender === secondColorButton ? 3 : 0
  }
}
