//
//  OnboardingPageViewController.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 14.10.2022.
//

import UIKit

/// Onboarding page controller with logic.
final class OnboardingPageViewController: UIPageViewController {
  
  // MARK: - Private Constants.
  
  private enum Constants {
    static let buyTitle = "Совершайте покупки не выходя из дома"
    static let knowledgeTitle = "Узнавайте о новинках первыми"
    static let economyTitle = "Экономьте с нашей системой лояльности"
    static let buyDescription = "Более 10000 актуальных позиций"
    static let knowledgeDescription = "Быстрые обновления и возможность предзаказов"
    static let economyDescription = "Гибкая система лояльности и возможность рассрочки"
    static let buyImageName = "buy"
    static let knowledgeImageName = "knowledge"
    static let economyImageName = "economy"
    static let skipTitle = "Пропустить"
    static let nextTitle = "Дальше"
    static let getStartedTitle = "Начинаем!"
    static let initialEntryKey = "firstEntry"
  }
  
  // MARK: - Public properties.
  var pages: [UIViewController] = [OnboardingViewController(headerText: Constants.buyTitle,
                                                            descriptionText: Constants.buyDescription,
                                                            imageName: Constants.buyImageName),
                                   OnboardingViewController(headerText: Constants.knowledgeTitle,
                                                            descriptionText: Constants.knowledgeDescription,
                                                            imageName: Constants.knowledgeImageName),
                                   OnboardingViewController(headerText: Constants.economyTitle,
                                                            descriptionText: Constants.economyDescription,
                                                            imageName: Constants.economyImageName)]
  var pageControlBottomAnchor: NSLayoutConstraint?
  var skipButtonBottomAnchor: NSLayoutConstraint?
  var nextButtonBottomAnchor: NSLayoutConstraint?
  var getStartedBottomAnchor: NSLayoutConstraint?
  let pageControl = UIPageControl()
  
  // MARK: - Private properties.
  private let skipButton = UIButton()
  private let nextButton = UIButton()
  private let getStartedButton = UIButton()
  private let initialPage = 0
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  // MARK: - Private visual components.
  private func setupSubviews() {
    configurePageController()
    createPageControl()
    createSkipButton()
    createNextButton()
    createGetStartedButton()
    setupConstraintsForPageControl()
    setupConstraintsForSkipButton()
    setupConstraintsForNextButton()
    setupConstraintsForGetStartedButton()
    setupConstraintForAnimationElements()
  }
  
  private func configurePageController() {
    dataSource = self
    delegate = self
    setViewControllers([pages[initialPage]],
                       direction: .forward,
                       animated: true,
                       completion: nil)
  }
  
  private func createPageControl() {
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    pageControl.currentPageIndicatorTintColor = .systemBlue
    pageControl.pageIndicatorTintColor = .gray
    pageControl.numberOfPages = pages.count
    pageControl.isEnabled = false
    pageControl.currentPage = initialPage
    view.addSubview(pageControl)
  }
  
  private func createSkipButton() {
    skipButton.translatesAutoresizingMaskIntoConstraints = false
    skipButton.setTitleColor(.gray, for: .normal)
    skipButton.setTitleColor(.systemBlue, for: .normal)
    skipButton.setTitle(Constants.skipTitle, for: .normal)
    skipButton.addTarget(self,
                         action: #selector(skipAction),
                         for: .touchUpInside)
    view.addSubview(skipButton)
    
  }
  
  private func createNextButton() {
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    nextButton.setTitleColor(.systemBlue, for: .normal)
    nextButton.setTitle(Constants.nextTitle, for: .normal)
    nextButton.addTarget(self,
                         action: #selector(nextAction),
                         for: .touchUpInside)
    view.addSubview(nextButton)
  }
  
  private func createGetStartedButton() {
    getStartedButton.translatesAutoresizingMaskIntoConstraints = false
    getStartedButton.setTitleColor(.systemBlue, for: .normal)
    getStartedButton.setTitle(Constants.getStartedTitle, for: .normal)
    getStartedButton.addTarget(self,
                               action: #selector(getStartedAction),
                               for: .touchUpInside)
    view.addSubview(getStartedButton)
  }
  
  private func setupConstraintsForPageControl() {
    NSLayoutConstraint.activate([
      pageControl.widthAnchor
        .constraint(equalToConstant: 150),
      pageControl.heightAnchor
        .constraint(equalToConstant: 20),
      pageControl.centerXAnchor
        .constraint(equalTo: view.centerXAnchor),
    ])
  }
  
  private func setupConstraintsForSkipButton() {
    NSLayoutConstraint.activate([
      skipButton.leadingAnchor
        .constraint(equalToSystemSpacingAfter: view.leadingAnchor,
                    multiplier: 2)
    ])
  }
  
  private func setupConstraintsForNextButton() {
    NSLayoutConstraint.activate([
      view.trailingAnchor
        .constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor,
                    multiplier: 4)
    ])
  }
  
  private func setupConstraintsForGetStartedButton() {
    NSLayoutConstraint.activate([
      getStartedButton.widthAnchor
        .constraint(equalToConstant: 150),
      getStartedButton.heightAnchor
        .constraint(equalToConstant: 20),
      getStartedButton.centerXAnchor
        .constraint(equalTo: view.centerXAnchor)
    ])
  }
  
  private func setupConstraintForAnimationElements() {
    pageControlBottomAnchor = view.bottomAnchor
      .constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor,
                  multiplier: 2)
    skipButtonBottomAnchor = view.bottomAnchor
      .constraint(equalToSystemSpacingBelow: skipButton.bottomAnchor,
                  multiplier: 2)
    nextButtonBottomAnchor = view.bottomAnchor
      .constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor,
                  multiplier: 2)
    getStartedBottomAnchor = view.bottomAnchor
      .constraint(equalToSystemSpacingBelow: getStartedButton.bottomAnchor,
                  multiplier: 2)
    
    pageControlBottomAnchor?.isActive = true
    skipButtonBottomAnchor?.isActive = true
    nextButtonBottomAnchor?.isActive = true
    getStartedBottomAnchor?.isActive = true
    getStartedBottomAnchor?.constant = -16
  }
  
  // MARK: - Private actions.
  @objc private func skipAction(_ sender: UIButton) {
    let lastPage = pages.count - 1
    pageControl.currentPage = lastPage
    
    goToLastPage(index: lastPage, ofViewControllers: pages)
    animateControlsOnLastPage()
  }
  
  @objc private func nextAction(_ sender: UIButton) {
    pageControl.currentPage += 1
    goToNextPage()
    animateControlsOnLastPage()
  }
  
  @objc private func getStartedAction(_ sender: UIButton) {
    UserStorage.shared.saveUser(forKey: Constants.initialEntryKey)
    let mainTabBarVC = MainTabBarViewController()
    mainTabBarVC.modalPresentationStyle = .fullScreen
    present(mainTabBarVC, animated: true)
  }
  
  private func goToNextPage(animated: Bool = true,
                            completion: ((Bool) -> Void)? = nil) {
    guard
      let currentPage = viewControllers?[0],
      let nextPage = dataSource?.pageViewController(self,
                                                    viewControllerAfter: currentPage)
    else {
      return
    }
    setViewControllers([nextPage],
                       direction: .forward,
                       animated: animated,
                       completion: completion)
  }
  
  private func goToLastPage(index: Int,
                            ofViewControllers pages: [UIViewController]) {
    setViewControllers([pages[index]],
                       direction: .forward,
                       animated: true,
                       completion: nil)
  }
}
