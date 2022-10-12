//
//  ForYouViewController+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 12.10.2022.
//

import UIKit

/// Create UI elements.
extension ForYouViewController {
  
  // MARK: - Public Visual components.
  func createTitleBlockLabels(frameY: Int, title: String) {
    let label = UILabel()
    label.frame = CGRect(x: 16, y: frameY, width: 300, height: 30)
    label.text = title
    label.alpha = 0.8
    label.textColor = .black
    label.font = UIFont(name: Constants.arialBoldFont, size: 23)
    scrollView.addSubview(label)
  }
  
  func createDeliveryStagesLabels(frameX: Int, title: String, fontColor: UIColor, width: Int) {
    let label = UILabel()
    label.frame = CGRect(x: frameX, y: 115, width: width, height: 20)
    label.text = title
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = fontColor
    deliveryOrderView.addSubview(label)
  }
  
  func createDeliveryTitle(frameY: Int, title: String, titleColor: UIColor, size: CGFloat) {
    let label = UILabel()
    label.frame = CGRect(x: 90, y: frameY, width: 180, height: 30)
    label.text = title
    label.font = UIFont.boldSystemFont(ofSize: size)
    label.textColor = titleColor
    deliveryOrderView.addSubview(label)
  }
  
  func createRecommendedInfoLabel(frameY: Int,
                                  textColor: UIColor,
                                  textSize: CGFloat,
                                  numberOfLines: Int,
                                  width: Int,
                                  title: String ) {
    let label = UILabel()
    label.frame = CGRect(x: 90, y: frameY, width: width, height: 45)
    label.text = title
    label.numberOfLines = numberOfLines
    label.font = UIFont.boldSystemFont(ofSize: textSize)
    label.textColor = textColor
    recommendedView.addSubview(label)
  }
  
  private func moveAndResizeImage(for height: CGFloat) {
    let coeff: CGFloat = {
      let delta = height - Constants.navBarHeightSmallState
      let heightDifferenceBetweenStates = (Constants.navBarHeightLargeState - Constants.navBarHeightSmallState)
      return delta / heightDifferenceBetweenStates
    }()
    
    let factor = Constants.avatarSizeForSmallState / Constants.avatarSizeForLargeTitle
    
    let scale: CGFloat = {
      let sizeAddendumFactor = coeff * (1.0 - factor)
      return min(1.0, sizeAddendumFactor + factor)
    }()
    
    let sizeDiff = Constants.avatarSizeForLargeTitle * (1.0 - factor)
    
    let yTransform: CGFloat = {
      
      let maxYTranslation = Constants.avatarBottomIndentForLargeTitle -
      Constants.avatarBottomIndentForNormTitle + sizeDiff
      return max(0, min(maxYTranslation, (maxYTranslation -
                                          coeff * (Constants.avatarBottomIndentForNormTitle + sizeDiff))))
    }()
    
    let xTransform = max(0, sizeDiff - coeff * sizeDiff)
    
    avatarImageView.transform = CGAffineTransform.identity
      .scaledBy(x: scale, y: scale)
      .translatedBy(x: xTransform, y: yTransform)
  }
}

/// UIScrollViewDelegate.
extension ForYouViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard let navBar = navigationController?.navigationBar else { return }
    let height = navBar.frame.height
    moveAndResizeImage(for: height)
  }
}
