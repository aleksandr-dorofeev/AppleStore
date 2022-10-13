//
//  UIImagePickerControllerDelegate+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 12.10.2022.
//

import UIKit

/// UIImagePickerControllerDelegate, UINavigationControllerDelegate.
extension ForYouViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    guard let image = info[.editedImage] as? UIImage else { return }
    let avatarImage = image.resizeImage(to: CGSize(width: 30, height: 30))
    avatarImageView.image = avatarImage
    guard let imageData = image.pngData() else { return }
    AvatarStorage.shared.saveAvatar(image: imageData, forKey: Constants.avatar)
    dismiss(animated: true)
  }
}
