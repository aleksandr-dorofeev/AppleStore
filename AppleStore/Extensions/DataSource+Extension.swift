//
//  DataSource+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 14.10.2022.
//

import UIKit

/// UIPageViewControllerDataSource.
extension OnboardingPageViewController: UIPageViewControllerDataSource {
  
  // MARK: - Public methods.
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
    if currentIndex == 0 {
      return pages.last
    } else {
      return pages[currentIndex - 1]
    }
  }
  
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
    if currentIndex < pages.count - 1 {
      return pages[currentIndex + 1]
    } else {
      return pages.first
    }
  }
}
