//
//  Delegate+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 14.10.2022.
//

import UIKit

/// UIPageViewControllerDelegate.
extension OnboardingPageViewController: UIPageViewControllerDelegate {
  
  // MARK: - Public methods.
  func pageViewController(_ pageViewController: UIPageViewController,
                          didFinishAnimating finished: Bool,
                          previousViewControllers: [UIViewController],
                          transitionCompleted completed: Bool) {
    guard
      let viewControllers = pageViewController.viewControllers,
      let currentIndex = pages.firstIndex(of: viewControllers[0])
    else {
      return
    }
    pageControl.currentPage = currentIndex
    animateControlsOnLastPage()
  }
  
  func animateControlsOnLastPage() {
    let lastPage = pageControl.currentPage == pages.count - 1
    if lastPage {
      hideControls()
      showGetStartedButton()
    } else {
      showControls()
    }
    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
  
  // MARK: - Private methods.
  private func hideControls() {
    pageControlBottomAnchor?.constant = -80
    skipButtonBottomAnchor?.constant = -80
    nextButtonBottomAnchor?.constant = -80
  }
  
  private func showControls() {
    pageControlBottomAnchor?.constant = 16
    skipButtonBottomAnchor?.constant = 16
    nextButtonBottomAnchor?.constant = 16
    getStartedBottomAnchor?.constant = -16
  }
  private func showGetStartedButton() {
    getStartedBottomAnchor?.constant = 16
  }
}
