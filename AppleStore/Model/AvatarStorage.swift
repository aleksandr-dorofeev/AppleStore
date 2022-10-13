//
//  AvatarStorage.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 12.10.2022.
//

import UIKit

/// Storage for avatars.
final class AvatarStorage {
  
  // MARK: - Public properties.
  static var shared = AvatarStorage()
  lazy var defaults = UserDefaults.standard
  
  // MARK: - Private init.
  private init() {}
  
  // MARK: - Public methods.
  func saveAvatar(image: Data, forKey: String) {
    defaults.set(image, forKey: forKey)
  }
  
  func verifyAvatar(forKey: String) -> UIImage? {
    guard
      let dataAvatar = defaults.object(forKey: forKey) as? Data,
      let avatar = UIImage(data: dataAvatar) else {
      return UIImage(named: forKey)
    }
    return avatar
  }
}
