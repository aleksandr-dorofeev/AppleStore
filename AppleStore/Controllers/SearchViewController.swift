//
//  SearchViewController.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 06.10.2022.
//

import UIKit

/// Search Screen.
final class SearchViewController: UIViewController {
  
  // MARK: - Public enums.
  enum Constants {
    static let placeholderForSearchController = "Поиск по продуктам и магазинам"
    static let recentlyTitleLabel = "Недавно просмотренные"
    static let queryOptionsTitleLabel = "Варианты запросов"
    static let helveticaBoldFont = "HelveticaNeue-Bold"
    static let helveticaFont = "HelveticaNeue"
    static let clearTitleButton = "Очистить"
    static let colorView = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1)
  }
  
  // MARK: - Public properties.
  let product = [Product(title: "Чехол Incase Flat для Macbook Pro 16 дюймов",
                         image: "case",
                         price: "3 990.00 руб"),
                 Product(title: "Спортивный ремешок Black Unity (для к...",
                         image: "sportsStrap",
                         price: "5 679.00 руб"),
                 Product(title: "Кожаный чехол для Macbook Pro 16 дюймов, золотой",
                         image: "leatherCase",
                         price: "7 299,00 руб")
  ]
  
  // MARK: - Public properties.
  lazy var productListView = UIView()
  
  // MARK: - Private properties.
  private lazy var searchController = UISearchController()
  private lazy var clearButton = UIButton()
  private lazy var caseMacbookView = UIView()
  private lazy var sportsStrapView = UIView()
  private lazy var leatherCaseView = UIView()
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubViews()
  }
  
  // MARK: - Private visual components.
  private func setupSubViews() {
    createSearchController()
    createRecentlyProductsLabel()
    createQueryOptionsLabel()
    createClearButton()
    createProductListView()
    createCaseMacbookView()
    createSportsStrapView()
    createLeatherCaseView()
    createAirPodsOptionView()
    createAppleCareOptionView()
    createBeatsOptionView()
    createCompareIphoneModelOptionView()
  }
  
  private func createSearchController() {
    searchController.searchBar.placeholder = Constants.placeholderForSearchController
    navigationItem.searchController = searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    definesPresentationContext = false
  }
  
  private func createRecentlyProductsLabel() {
    createTitleToBlocksLabel( title: Constants.recentlyTitleLabel, frameY: 200)
  }
  
  private func createQueryOptionsLabel() {
    createTitleToBlocksLabel( title: Constants.queryOptionsTitleLabel, frameY: 440)
  }
  
  private func createProductListView() {
    productListView.frame = CGRect(x: 16, y: 235, width: 500, height: 180)
    view.addSubview(productListView)
  }
  
  private func createClearButton() {
    clearButton.frame = CGRect(x: 280, y: 200, width: 80, height: 30)
    clearButton.setTitle(Constants.clearTitleButton, for: .normal)
    clearButton.setTitleColor( .systemBlue, for: .normal)
    clearButton.titleLabel?.font = .systemFont(ofSize: 15)
    clearButton.titleLabel?.textAlignment = .center
    view.addSubview(clearButton)
  }
  
  private func createCaseMacbookView() {
    createProductView(productView: caseMacbookView,
                      tagView: 1,
                      imageName: product[0].image,
                      productTitle: product[0].title,
                      frameX: 0)
  }
  
  private func createSportsStrapView() {
    createProductView(productView: sportsStrapView,
                      tagView: 2,
                      imageName: product[1].image,
                      productTitle: product[1].title,
                      frameX: 140)
  }
  
  private func createLeatherCaseView() {
    createProductView(productView: leatherCaseView,
                      tagView: 3,
                      imageName: product[2].image,
                      productTitle: product[2].title,
                      frameX: 280)
  }
  
  private func createAirPodsOptionView() {
    createRequestOptionsView(title: "Airpods", frameY: 480)
  }
  
  private func createAppleCareOptionView() {
    createRequestOptionsView(title: "AppleCare", frameY: 530)
  }
  
  private func createBeatsOptionView() {
    createRequestOptionsView(title: "Beats", frameY: 580)
  }
  
  private func createCompareIphoneModelOptionView() {
    createRequestOptionsView(title: "Сравните модели iPhone", frameY: 630)
  }
}
