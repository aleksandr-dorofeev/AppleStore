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
    static let recentlyTitle = "Недавно просмотренные"
    static let queryOptionsTitle = "Варианты запросов"
    static let helveticaBoldFont = "HelveticaNeue-Bold"
    static let helveticaFont = "HelveticaNeue"
    static let clearTitle = "Очистить"
    static let searchImageName = "magnifyingglass"
    static let airpodsRequest = "Airpods"
    static let appleCareRequest = "AppleCare"
    static let beatsRequest = "Beats"
    static let compareRequest = "Сравните модели iPhone"
  }
  
  // MARK: - Public properties.
  lazy var productListScrollView = UIScrollView()
  
  // MARK: - Private properties.
  private lazy var searchController = UISearchController()
  private lazy var clearButton = UIButton()
  private lazy var caseMacbookView = UIView()
  private lazy var sportsStrapView = UIView()
  private lazy var leatherCaseView = UIView()
  private lazy var iphoneView = UIView()
  private lazy var airPodsView = UIView()
  private lazy var macbookView = UIView()
  
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
    createProductListScrollView()
    createCaseMacbookView()
    createSportsStrapView()
    createLeatherCaseView()
    createIphoneView()
    createAirPodsView()
    createMacbookView()
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
    createTitleToBlocksLabel( title: Constants.recentlyTitle, frameY: 200)
  }
  
  private func createQueryOptionsLabel() {
    createTitleToBlocksLabel( title: Constants.queryOptionsTitle, frameY: 440)
  }
  
  private func createProductListScrollView() {
    productListScrollView.frame = CGRect(x: 16, y: 235, width: 500, height: 180)
    productListScrollView.isPagingEnabled = false
    productListScrollView.showsHorizontalScrollIndicator = false
    productListScrollView.contentSize = CGSize(width: productListScrollView.frame.width * 2,
                                               height: productListScrollView.frame.height)
    view.addSubview(productListScrollView)
  }
  
  private func createClearButton() {
    clearButton.frame = CGRect(x: 280, y: 200, width: 80, height: 30)
    clearButton.setTitle(Constants.clearTitle, for: .normal)
    clearButton.setTitleColor( .systemBlue, for: .normal)
    clearButton.titleLabel?.font = .systemFont(ofSize: 15)
    clearButton.titleLabel?.textAlignment = .center
    view.addSubview(clearButton)
  }
  
  private func createCaseMacbookView() {
    createProductView(productView: caseMacbookView,
                      tagView: 0,
                      imageName: Products.shared.products[0].imageName[0],
                      productTitle: Products.shared.products[0].title,
                      frameX: 0)
  }
  
  private func createSportsStrapView() {
    createProductView(productView: sportsStrapView,
                      tagView: 1,
                      imageName: Products.shared.products[1].imageName[0],
                      productTitle: Products.shared.products[1].title,
                      frameX: 140)
  }
  
  private func createLeatherCaseView() {
    createProductView(productView: leatherCaseView,
                      tagView: 2,
                      imageName: Products.shared.products[2].imageName[0],
                      productTitle: Products.shared.products[2].title,
                      frameX: 280)
  }
  
  private func createIphoneView() {
    createProductView(productView: iphoneView,
                      tagView: 3,
                      imageName: Products.shared.products[3].imageName[0],
                      productTitle: Products.shared.products[3].title,
                      frameX: 420)
  }
  
  private func createAirPodsView() {
    createProductView(productView: airPodsView,
                      tagView: 4,
                      imageName: Products.shared.products[4].imageName[0],
                      productTitle: Products.shared.products[4].title,
                      frameX: 560)
  }
  
  private func createMacbookView() {
    createProductView(productView: macbookView,
                      tagView: 5,
                      imageName: Products.shared.products[5].imageName[0],
                      productTitle: Products.shared.products[5].title,
                      frameX: 700)
  }
  
  private func createAirPodsOptionView() {
    createRequestOptionsView(title: Constants.airpodsRequest, frameY: 480)
  }
  
  private func createAppleCareOptionView() {
    createRequestOptionsView(title: Constants.appleCareRequest, frameY: 530)
  }
  
  private func createBeatsOptionView() {
    createRequestOptionsView(title: Constants.beatsRequest, frameY: 580)
  }
  
  private func createCompareIphoneModelOptionView() {
    createRequestOptionsView(title: Constants.compareRequest, frameY: 630)
  }
}
