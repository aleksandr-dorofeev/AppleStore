//
//  Collection+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 10.10.2022.
//

import Foundation

/// Extension for secure data retrieval.
extension Collection {
  subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
