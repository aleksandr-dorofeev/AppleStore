//
//  SearchViewController+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 06.10.2022.
//

import UIKit

/// Extension for add UI elements on view.
extension SearchViewController {
  
  // MARK: - Public Visual components.
  func createTitleToBlocksLabel( title: String, frameY: Int) {
    let label = UILabel()
    label.frame = CGRect(x: 16, y: frameY, width: 260, height: 30)
    label.text = title
    label.font = UIFont(name: Constants.helveticaBoldFont, size: 20)
    view.addSubview(label)
  }
  
  func createProductView(productView: UIView,
                         tagView: Int,
                         imageName: String,
                         productTitle: String,
                         frameX: Int) {
    createSubview(productView, tagView: tagView, frameX: frameX)
    createProductImageView(productView, imageName: imageName)
    createProductLabel(productView, title: productTitle)
    addGestureRecognizer(productView)
    productListScrollView.addSubview(productView)
  }
  
  func createRequestOptionsView(title: String, frameY: Int) {
    let requestOptView = UIView()
    requestOptView.frame = CGRect(x: 16, y: frameY, width: 358, height: 40)
    requestOptView.addBottomBorder()
    createLabelForRequestOption(requestOptView, title: title)
    createImageViewForRequestOption(requestOptView)
    view.addSubview(requestOptView)
  }
  
  // MARK: - Private Visual components.
  private func createSubview(_ productView: UIView, tagView: Int, frameX: Int) {
    productView.frame = CGRect(x: frameX, y: 5, width: 130, height: 170)
    productView.layer.cornerRadius = 20
    productView.tag = tagView
    productView.backgroundColor = .systemGray6
  }
  
  private func createProductImageView(_ view: UIView, imageName: String) {
    let imageView = UIImageView()
    imageView.frame = CGRect(x: 15, y: 15, width: 100, height: 80)
    imageView.image = UIImage(named: imageName)
    imageView.contentMode = .scaleAspectFit
    view.addSubview(imageView)
  }
  
  private func createProductLabel(_ view: UIView, title: String) {
    let label = UILabel()
    label.frame = CGRect(x: 10, y: 100, width: 110, height: 50)
    label.text = title
    label.font = UIFont(name: Constants.helveticaBoldFont, size: 12)
    label.textAlignment = .left
    label.numberOfLines = 0
    view.addSubview(label)
  }
  
  private func createImageViewForRequestOption(_ view: UIView) {
    let imageView = UIImageView(image: UIImage(systemName: Constants.searchImageName))
    imageView.frame = CGRect(x: 0, y: 10, width: 20, height: 20)
    imageView.tintColor = .lightGray
    view.addSubview(imageView)
  }
  
  private func createLabelForRequestOption(_ view: UIView, title: String) {
    let label = UILabel()
    label.frame = CGRect(x: 35, y: 10, width: 300, height: 20)
    label.text = title
    label.font = UIFont(name: Constants.helveticaFont, size: 20)
    label.textAlignment = .left
    view.addSubview(label)
  }
  
  private func addGestureRecognizer(_ productView: UIView) {
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapAction))
    tap.numberOfTapsRequired = 1
    productView.addGestureRecognizer(tap)
    productView.isUserInteractionEnabled = true
  }
  
  // MARK: - Private actions.
  @objc private func handleTapAction(sender: UITapGestureRecognizer) {
    let detailVC = DetailViewController()
    guard let tag = sender.view?.tag else { return }
    detailVC.nameProductLabel.text = Products.shared.products[tag].title
    detailVC.imageNames = Products.shared.products[tag].imageName
    detailVC.priceLabel.text = Products.shared.products[tag].price
    detailVC.productUrl = Products.shared.products[tag].url
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
