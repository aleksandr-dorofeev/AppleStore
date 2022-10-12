//
//  ForYouViewController.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 06.10.2022.
//

import UIKit

/// Screen with recommendations.
final class ForYouViewController: UIViewController {
  
  // MARK: - Constants.
  enum Constants {
    static let newTitle = "Вот что нового"
    static let recommendedTitle = "Рекомендуется Вам"
    static let yourDevicesTitle = "Ваши устройства"
    static let deliveryDoneTitle = "Ваш заказ отправлен"
    static let additionalInfoTitle = "1 товар, доставка завтра"
    static let showAllTitle = "Показать все"
    static let arialFont = "Arial"
    static let beingProcessedTitle = "Обрабатывается"
    static let deliveryStatusTitle = "Отправлено"
    static let deliveryDoneStatusTitle = "Доставлено"
    static let shevronImageName = "chevron.right"
    static let airpodsImageName = "airpodsPro"
    static let newsAboutDeliveryTitle = "Получайте новости о своем заказе в режиме реального времени."
    static let notificationAboutDeliveryTitle = "Включите режим уведомления, чтобы\nполучать новости о своем заказе."
    static let dotSquareImageName = "dot.square"
    static let avatar = "avatar"
    static let arialBoldFont = "Arial Bold"
    static let avatarSizeForLargeTitle: CGFloat = 45
    static let avatarRightIndent: CGFloat = 17
    static let avatarBottomIndentForLargeTitle: CGFloat = 14
    static let avatarBottomIndentForNormTitle: CGFloat = 7
    static let avatarSizeForSmallState: CGFloat = 32
    static let navBarHeightSmallState: CGFloat = 40
    static let navBarHeightLargeState: CGFloat = 95
  }
  
  // MARK: - Public properties.
  lazy var scrollView = UIScrollView(frame: view.bounds)
  lazy var deliveryOrderView = UIView()
  lazy var recommendedView = UIView()
  lazy var avatarImageView = UIImageView()
  
  // MARK: - Private properties.
  private lazy var showAllButton = UIButton()
  private lazy var emptyImageView = UIImageView()
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.addCustomBottomLine(color: .lightGray, height: 0.2)
    setupTapBarAppearanceOnThisView(style: .light)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    setupTapBarAppearanceOnThisView(style: .unspecified)
  }
  
  private func setupSubviews() {
    createScrollView()
    createShowEveryoneButton()
    createDeliveryOrderView()
    setupBlockLabels()
    setupDeliveryStagesLabels()
    setupDeliveryTitlesLabels()
    createDeliveredOrderImage()
    createSeparateView()
    createProgressDeliveryView()
    createDetailsDeliveryButton()
    createRecommendedView()
    setupRecommendedInfoLabels()
    createDetailsRecommendationButton()
    createRecommendationImage()
    createAvatarItem()
  }
  
  private func createScrollView() {
    scrollView.showsVerticalScrollIndicator = true
    scrollView.contentInsetAdjustmentBehavior = .never
    scrollView.indicatorStyle = .black
    scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height * 2)
    view.addSubview(scrollView)
  }
  
  private func createDeliveryOrderView() {
    deliveryOrderView.frame = CGRect(x: 16, y: 220, width: view.frame.width - 30, height: 150)
    deliveryOrderView.backgroundColor = .white
    deliveryOrderView.layer.shadowColor = UIColor.darkGray.cgColor
    deliveryOrderView.layer.shadowOpacity = 1
    deliveryOrderView.layer.shadowRadius = 10
    deliveryOrderView.layer.cornerRadius = 10
    deliveryOrderView.layer.shadowOffset = .zero
    scrollView.addSubview(deliveryOrderView)
  }
  
  private func setupBlockLabels() {
    createTitleBlockLabels(frameY: 170, title: Constants.newTitle)
    createTitleBlockLabels(frameY: 450, title: Constants.recommendedTitle)
    createTitleBlockLabels(frameY: 650, title: Constants.yourDevicesTitle)
  }
  
  private func setupDeliveryTitlesLabels() {
    createDeliveryTitle(frameY: 15, title: Constants.deliveryDoneTitle, titleColor: .black, size: 14)
    createDeliveryTitle(frameY: 40, title: Constants.additionalInfoTitle, titleColor: .lightGray, size: 13)
  }
  
  private func createShowEveryoneButton() {
    showAllButton.frame = CGRect(x: 230, y: 650, width: 125, height: 30)
    showAllButton.setTitle(Constants.showAllTitle, for: .normal)
    showAllButton.setTitleColor(.tintColor, for: .normal)
    showAllButton.titleLabel?.font = UIFont(name: Constants.arialFont, size: 15)
    scrollView.addSubview(showAllButton)
  }
  
  private func createProgressDeliveryView() {
    let deliveryProgressView = UIProgressView()
    deliveryProgressView.frame = CGRect(x: 16, y: 105, width: deliveryOrderView.bounds.width - 30, height: 20)
    deliveryProgressView.trackTintColor = .systemGray6
    deliveryProgressView.tintColor = .systemGreen
    deliveryProgressView.progress = 0.5
    deliveryProgressView.transform = deliveryProgressView.transform.scaledBy(x: 1, y: 2)
    deliveryOrderView.addSubview(deliveryProgressView)
  }
  
  private func setupDeliveryStagesLabels() {
    createDeliveryStagesLabels(frameX: 16, title: Constants.beingProcessedTitle, fontColor: .black, width: 110)
    createDeliveryStagesLabels(frameX: 150, title: Constants.deliveryStatusTitle, fontColor: .black, width: 90)
    createDeliveryStagesLabels(frameX: 260, title: Constants.deliveryDoneStatusTitle, fontColor: .lightGray, width: 80)
  }
  
  private func createDetailsDeliveryButton() {
    let deliveryDetailsButton = UIButton()
    deliveryDetailsButton.frame = CGRect(x: 310, y: 45, width: 25, height: 25)
    deliveryDetailsButton.setImage(UIImage(systemName: Constants.shevronImageName), for: .normal)
    deliveryDetailsButton.tintColor = .gray
    deliveryOrderView.addSubview(deliveryDetailsButton)
  }
  
  private func createSeparateView() {
    let separateLineView = UIView()
    separateLineView.frame = CGRect(x: 0, y: 90, width: 358, height: 1)
    separateLineView.backgroundColor = .systemGray4
    deliveryOrderView.addSubview(separateLineView)
  }
  
  private func createDeliveredOrderImage() {
    let itemImageView = UIImageView()
    itemImageView.image = UIImage(named: Constants.airpodsImageName)
    itemImageView.frame = CGRect(x: 10, y: 15, width: 65, height: 65)
    itemImageView.contentMode = .scaleAspectFit
    deliveryOrderView.addSubview(itemImageView)
  }
  
  private func createRecommendedView() {
    recommendedView.frame = CGRect(x: 16, y: 480, width: view.frame.width - 30, height: 120)
    recommendedView.addBottomBorder()
    scrollView.addSubview(recommendedView)
  }
  
  private func setupRecommendedInfoLabels() {
    createRecommendedInfoLabel(frameY: 20,
                               textColor: .black,
                               textSize: 12,
                               numberOfLines: 3,
                               width: 180,
                               title: Constants.newsAboutDeliveryTitle)
    createRecommendedInfoLabel(frameY: 65,
                               textColor: .gray,
                               textSize: 10,
                               numberOfLines: 2,
                               width: 210,
                               title: Constants.notificationAboutDeliveryTitle)
  }
  
  private func createRecommendationImage() {
    let itemImageView = UIImageView()
    itemImageView.image = UIImage(systemName: Constants.dotSquareImageName)
    itemImageView.tintColor = .red
    itemImageView.frame = CGRect(x: 10, y: 15, width: 40, height: 40)
    itemImageView.contentMode = .scaleAspectFit
    recommendedView.addSubview(itemImageView)
  }
  
  private func createDetailsRecommendationButton() {
    let recommendationDetailsButton = UIButton()
    recommendationDetailsButton.frame = CGRect(x: 310, y: 45, width: 25, height: 25)
    recommendationDetailsButton.setImage(UIImage(systemName: Constants.shevronImageName), for: .normal)
    recommendationDetailsButton.tintColor = .gray
    recommendedView.addSubview(recommendationDetailsButton)
  }
  
  private func createEmptyImageView() {
    emptyImageView.frame = CGRect(x: 315, y: 85, width: 50, height: 50)
    emptyImageView.layer.masksToBounds = true
    emptyImageView.backgroundColor = .red
  }
  
  private func createAvatarItem() {
    guard let navBar = navigationController?.navigationBar else { return }
    avatarImageView.isUserInteractionEnabled = true
    avatarImageView.clipsToBounds = true
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    avatarImageView.tintColor = .gray
    avatarImageView.layer.cornerRadius = Constants.avatarSizeForLargeTitle / 2
    avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                action: #selector(changeAvatarAction)))
    avatarImageView.image = AvatarStorage.shared.verifyAvatar(forKey: Constants.avatar)
    navBar.addSubview(avatarImageView)
    createConstraintsForAvatar(navBar: navBar)
  }
  
  private func createConstraintsForAvatar(navBar: UINavigationBar) {
    NSLayoutConstraint.activate([
      avatarImageView.rightAnchor.constraint(equalTo: navBar.rightAnchor,
                                             constant: -Constants.avatarRightIndent),
      avatarImageView.bottomAnchor.constraint(equalTo: navBar.bottomAnchor,
                                              constant: -Constants.avatarBottomIndentForLargeTitle),
      avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarSizeForLargeTitle),
      avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor)
    ])
  }
  
  private func setupTapBarAppearanceOnThisView(style: UIUserInterfaceStyle) {
    overrideUserInterfaceStyle = style
    tabBarController?.overrideUserInterfaceStyle = style
    navigationController?.navigationBar.overrideUserInterfaceStyle = style
  }
  
  @objc private func changeAvatarAction() {
    let avatarPickerController = UIImagePickerController()
    avatarPickerController.allowsEditing = true
    avatarPickerController.delegate = self
    avatarPickerController.sourceType = .photoLibrary
    present(avatarPickerController, animated: true)
  }
}
