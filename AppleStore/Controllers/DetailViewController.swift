//
//  DetailViewController.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 07.10.2022.
//

import UIKit

/// Detail product screen.
final class DetailViewController: UIViewController {
  
  // MARK: - Private enums.
  private enum Constants {
    static let helveticaFont = "HelveticaNeue"
  }
  
  // MARK: - Public properties.
  lazy var nameProductLabel = UILabel()
  lazy var priceLabel = UILabel()
  lazy var productImageView = UIImageView()
  lazy var addButton = UIButton()
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  // MARK: - Private visual components.
  private func setupSubviews() {
    createProductLabel()
    createProductImageView()
    createPriceLabel()
  }
  
  private func createProductLabel() {
    nameProductLabel.frame = CGRect(x: 0, y: 100, width: 358, height: 40)
    nameProductLabel.center.x = view.center.x
    nameProductLabel.numberOfLines = 0
    nameProductLabel.font = UIFont(name: Constants.helveticaFont, size: 14)
    nameProductLabel.textAlignment = .center
    view.addSubview(nameProductLabel)
  }
  
  private func createPriceLabel() {
    priceLabel.frame = CGRect(x: 0, y: 130, width: 135, height: 25)
    priceLabel.center.x = view.center.x
    priceLabel.textAlignment = .center
    priceLabel.font = UIFont(name: Constants.helveticaFont, size: 13)
    priceLabel.textColor = .darkGray
    view.addSubview(priceLabel)
  }
  
  private func createProductImageView() {
    productImageView.frame = CGRect(x: 16, y: 160, width: 358, height: 248)
    productImageView.contentMode = .scaleAspectFit
    view.addSubview(productImageView)
  }
}
