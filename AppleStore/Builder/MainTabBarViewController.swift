//
//  MainTabBarViewController.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 06.10.2022.
//

import UIKit

/// Controller.
final class MainTabBarViewController: UITabBarController {
  
  // MARK: - Private enum.
  private enum Constants {
    static let buyTitle = "Купить"
    static let forYouTitle = "Для Вас"
    static let searchTitle = "Поиск"
    static let basketTitle = "Корзина"
    static let buyImageName = "laptopcomputer.and.iphone"
    static let forYouImageName = "person.crop.circle"
    static let searchImageName = "magnifyingglass"
    static let bagImageName = "bag"
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
    UITabBar.appearance().backgroundColor = .secondarySystemBackground
    tabBar.tintColor = .systemBlue
  }
  
  private func setupNavigationsToTabBar() {
    viewControllers = [createNavigationControllers(for: BuyViewController(),
                                                   title: Constants.buyTitle,
                                                   imageName: Constants.buyImageName),
                       createNavigationControllers(for: ForYouViewController(),
                                                   title: Constants.forYouTitle,
                                                   imageName: Constants.forYouImageName),
                       createNavigationControllers(for: SearchViewController(),
                                                   title: Constants.searchTitle,
                                                   imageName: Constants.searchImageName),
                       createNavigationControllers(for: BasketViewController(),
                                                   title: Constants.basketTitle,
                                                   imageName: Constants.bagImageName)]
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
