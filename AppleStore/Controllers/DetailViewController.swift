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
    static let helveticaFontBold = "HelveticaNeue-Bold"
    static let stringValue = "Совместно с Macbook Pro — Александр"
    static let addTitle = "Добавить в корзину"
    static let checkMarkName = "checkmark.circle.fill"
    static let shipingBoxName = "shippingbox"
    static let deliveryMessage = """
Заказ сегодня в течение дня, доставка:
Чт 25 Фев - Бесплатно
Варианты доставки для местоположения: 115533
"""
    static let heart = "heart"
    static let share = "square.and.arrow.up"
  }
  
  // MARK: - Public properties.
  lazy var nameProductLabel = UILabel()
  lazy var priceLabel = UILabel()
  lazy var productImageView = UIImageView()
  lazy var firstColorButton = makeColorButton(xCoordinate: 145)
  lazy var secondColorButton = makeColorButton(xCoordinate: 205)
  var imageNames: [String] = []
  
  // MARK: - Private properties.
  lazy private var imagesScrollView = UIScrollView()
  lazy private var descriptionLabel = UILabel()
  lazy private var checkMarkImageView = UIImageView()
  lazy private var checkMarkLabel = UILabel()
  lazy private var addButton = UIButton()
  lazy private var deliveryView = UIView()
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNavigationBar(largeTitle: false, color: .secondarySystemBackground)
    createNavigationItems()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    configureNavigationBar(largeTitle: true, color: .clear)
  }
  
  // MARK: - Private visual components.
  private func setupSubviews() {
    createBackgroundColor()
    createScrollViewImages()
    createProductLabel()
    createProductImageView()
    createPriceLabel()
    createDescriptionLabel()
    createCheckmarkLabel()
    createAddButton()
    createCheckMarkImage()
    createDeliveryView()
    createDeliveryImage()
    createDeliveryLabel()
    configureColorButtons()
  }
  
  private func createBackgroundColor() {
    view.backgroundColor = .systemBackground
  }
  
  private func configureColorButtons() {
    addGradientForButton(button: secondColorButton)
    view.addSubview(firstColorButton)
    secondColorButton.layer.shadowRadius = 3
  }
  
  private func configureNavigationBar(largeTitle: Bool, color: UIColor) {
    let navBar = navigationController?.navigationBar
    let appearance = UINavigationBarAppearance()
    if largeTitle == true {
      appearance.configureWithTransparentBackground()
    } else {
      appearance.configureWithOpaqueBackground()
    }
    appearance.backgroundColor = color
    navBar?.standardAppearance = appearance
    navBar?.scrollEdgeAppearance = navBar?.standardAppearance
    navBar?.prefersLargeTitles = largeTitle
  }
  
  private func createScrollViewImages() {
    let widthScroll = view.bounds.width
    let scrollViewRect = CGRect(x: 0, y: 150, width: widthScroll, height: 180)
    imagesScrollView = UIScrollView(frame: scrollViewRect)
    imagesScrollView.showsHorizontalScrollIndicator = true
    imagesScrollView.isPagingEnabled = true
    imagesScrollView.contentSize = CGSize(width: scrollViewRect.size.width *
                                          CGFloat(imageNames.count),
                                          height: scrollViewRect.size.height)
    view.addSubview(imagesScrollView)
  }
  
  private func createProductLabel() {
    nameProductLabel.frame = CGRect(x: 0, y: 100, width: 358, height: 40)
    nameProductLabel.center.x = view.center.x
    nameProductLabel.numberOfLines = 0
    nameProductLabel.font = UIFont(name: Constants.helveticaFontBold, size: 13)
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
  
  private func createDescriptionLabel() {
    descriptionLabel.frame = CGRect(x: 16, y: 360, width: 358, height: 30)
    descriptionLabel.text = nameProductLabel.text
    descriptionLabel.textAlignment = .center
    descriptionLabel.font = UIFont(name: Constants.helveticaFont, size: 11)
    descriptionLabel.textColor = .lightGray
    view.addSubview(descriptionLabel)
  }
  
  private func createCheckmarkLabel() {
    checkMarkLabel.frame = CGRect(x: 100, y: 530, width: 358, height: 40)
    checkMarkLabel.textAlignment = .left
    let attributedString = NSMutableAttributedString(string: Constants.stringValue)
    let prefixSubstring = Constants.stringValue.prefix(11)
    let suffixSubstring = Constants.stringValue.suffix(24)
    attributedString.setColorForText(textForAttribute: String(prefixSubstring), withColor: .darkGray)
    attributedString.setColorForText(textForAttribute: String(suffixSubstring), withColor: .systemBlue)
    checkMarkLabel.font = .boldSystemFont(ofSize: 11)
    checkMarkLabel.attributedText = attributedString
    view.addSubview(checkMarkLabel)
  }
  
  private func createCheckMarkImage() {
    let image = UIImage(systemName: Constants.checkMarkName)
    checkMarkImageView.image = image
    checkMarkImageView.tintColor = .green
    checkMarkImageView.frame = CGRect(x: 70, y: 540, width: 20, height: 20)
    view.addSubview(checkMarkImageView)
  }
  
  private func createAddButton() {
    addButton.frame = CGRect(x: 16, y: 600, width: 358, height: 35)
    addButton.layer.cornerRadius = 10
    addButton.setTitle(Constants.addTitle, for: .normal)
    addButton.tintColor = .label
    addButton.backgroundColor = .systemBlue
    view.addSubview(addButton)
  }
  
  private func createDeliveryView() {
    deliveryView.frame = CGRect(x: 16, y: 670, width: 358, height: 60)
    view.addSubview(deliveryView)
  }
  
  private func createDeliveryImage() {
    let image = UIImage(systemName: Constants.shipingBoxName)
    let imageView = UIImageView(image: image)
    imageView.frame = CGRect(x: 8, y: 5, width: 15, height: 15)
    imageView.tintColor = .gray
    deliveryView.addSubview(imageView)
  }
  
  private func createDeliveryLabel() {
    let label = UILabel()
    label.frame = CGRect(x: 35, y: 0, width: 295, height: 47)
    label.numberOfLines = 3
    label.font = .systemFont(ofSize: 11)
    label.textColor = .gray
    label.textAlignment = .left
    let attributedString = NSMutableAttributedString(string: Constants.deliveryMessage)
    let prefixSubstring = Constants.deliveryMessage.prefix(38)
    let suffixSubstring = Constants.deliveryMessage.suffix(44)
    attributedString.setColorForText(textForAttribute: String(prefixSubstring), withColor: .label)
    attributedString.setColorForText(textForAttribute: String(suffixSubstring), withColor: .systemBlue)
    label.attributedText = attributedString
    deliveryView.addSubview(label)
  }
  
  private func createProductImageView() {
    var frameX = 40
    for image in imageNames {
      setupItemImage(itemImageName: image, frameX: frameX)
      frameX += 375
    }
  }
  
  private func setupItemImage(itemImageName: String, frameX: Int) {
    let imageView = UIImageView(frame: CGRect(x: frameX, y: 30, width: 300, height: 125))
    imageView.image = UIImage(named: itemImageName)
    imageView.contentMode = .scaleAspectFit
    imagesScrollView.addSubview(imageView)
  }
  
  private func createNavigationItems() {
    let shareButton = UIButton()
    shareButton.setImage(UIImage(systemName: Constants.share), for: .normal)
    shareButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    let shareItem = UIBarButtonItem()
    shareItem.customView = shareButton
    
    let likeButton = UIButton()
    likeButton.setImage(UIImage(systemName: Constants.heart), for: .normal)
    likeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    let likeItem = UIBarButtonItem()
    likeItem.customView = likeButton
    navigationItem.rightBarButtonItems = [likeItem, shareItem]
  }
}
