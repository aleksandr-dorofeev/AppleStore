//
//  TabBarViewController.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 06.10.2022.
//

import UIKit

/// Controller.
final class TabBarViewController: UITabBarController {
  
  // MARK: - Private enum.
  private enum Constants {
    static let buyTitle = "Купить"
    static let forYouTitle = "Для Вас"
    static let searchTitle = "Поиск"
    static let basketTitle = "Корзина"
    static let buyImage = "laptopcomputer.and.iphone"
    static let forYouImage = "person.crop.circle"
    static let searchImage = "magnifyingglass"
    static let bagImage = "bag"
    static let tabBarBackgroundColor = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1)
  }
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Private visual components.
  private func setupView() {
    configureTabBar()
    setupNavigationsToTabBar()
  }
  
  private func configureTabBar() {
    view.backgroundColor = .systemBackground
    UITabBar.appearance().barTintColor = .systemBackground
    UITabBar.appearance().backgroundColor = Constants.tabBarBackgroundColor
    tabBar.tintColor = .systemBlue
  }
  
  private func setupNavigationsToTabBar() {
    viewControllers = [createNavigationControllers(for: BuyViewController(),
                                                   title: Constants.buyTitle,
                                                   imageName: Constants.buyImage),
                       createNavigationControllers(for: ForYouViewController(),
                                                   title: Constants.forYouTitle,
                                                   imageName: Constants.forYouImage),
                       createNavigationControllers(for: SearchViewController(),
                                                   title: Constants.searchTitle,
                                                   imageName: Constants.searchImage),
                       createNavigationControllers(for: BasketViewController(),
                                                   title: Constants.basketTitle,
                                                   imageName: Constants.bagImage)]
  }
  
  private func createNavigationControllers(for rootViewController: UIViewController,
                                           title: String,
                                           imageName: String) -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: rootViewController)
    navigationController.tabBarItem.title = title
    navigationController.tabBarItem.image = UIImage(systemName: imageName)
    navigationController.navigationBar.prefersLargeTitles = true
    navigationController.navigationBar.isTranslucent = true
    navigationController.navigationBar.backgroundColor = .clear
    rootViewController.navigationItem.title = title
    return navigationController
  }
}
