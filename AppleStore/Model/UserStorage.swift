//
//  UserStorage.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 13.10.2022.
//

import Foundation

/// Global Constants.
enum Constants {
  static let isEntry = "firstEntry"
}

/// Storage for save and verify first entry.
final class UserStorage {
  
  static let shared = UserStorage()
  lazy var defaults = UserDefaults.standard
  
  func saveUser(forKey: String) {
    defaults.set(true, forKey: forKey)
  }
  
  func verifyUser(forKey: String) -> Bool {
    let isNewUser = defaults.bool(forKey: forKey)
    return isNewUser
  }
  
  private init() {}
}
