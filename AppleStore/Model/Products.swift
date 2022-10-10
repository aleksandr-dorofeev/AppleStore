//
//  Products.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 09.10.2022.
//

import Foundation

/// Product data class.
final class Products {
  
  static let shared = Products()
  
  let products = [Product(title: "Чехол Incase Flat для Macbook Pro 16 дюймов",
                          imageName: ["case", "case2", "case3"],
                          price: "3 990.00 руб."),
                  Product(title: "Спортивный ремешок Black Unity (для к...",
                          imageName: ["sportsStrap", "sportsStrap2"],
                          price: "5 679.00 руб."),
                  Product(title: "Кожаный чехол для Macbook Pro 16 дюймов, золотой",
                          imageName: ["leatherCase", "leatherCase2", "leatherCase3"],
                          price: "7 299,00 руб."),
                  Product(title: "Iphone 12 Pro",
                          imageName: ["iphone12pro"],
                          price: "79 399,00 руб."),
                  Product(title: "Airpods Pro",
                          imageName: ["airpodsPro"],
                          price: "23 569,00 руб."),
                  Product(title: "Macbook Pro (16-inch, 2021)",
                          imageName: ["macbookPro"],
                          price: "123 799,00 руб.")
  ]
}
