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
  
  // swiftlint:disable all
  let products = [Product(title: "Чехол Incase Flat для Macbook Pro 16 дюймов",
                          imageName: ["case", "case2", "case3"],
                          price: "3 990.00 руб.",
                          url: "product/HQ272ZM/A/incase-compact-sleeve-in-flight-nylon-for-14-macbook-pro?fnode=21c233d3c17dc75ee73cee2687b3cfe9f4659e6244e6b9d51bdbeef7d553d2e14a71a34a43b5f55940f3741178adb6077ccda8bfd2a3f7585cbbcb5788005db8eea46c27f788cdcdd8d42f662ea750da5334b3920648ab24f1bdf36b037fcf09988a61bb834f2d1c790708828339efcb"),
                  Product(title: "Спортивный ремешок Black Unity",
                          imageName: ["sportsStrap", "sportsStrap2"],
                          price: "5 679.00 руб.",
                          url: "product/MQDY3AM/A/49mm-orange-alpine-loop-small?fnode=72685a725bacf95dd256d5f3dfe8f20be9f0ff303612d5558d006766dc4a0210e8cf2fe4e8190cbe690e5e19eb9f770984c182ba52ead5178198c1cd51367fae8dd6c59cc6dd339e83edd07d31b13b2c"),
                  Product(title: "Кожаный чехол для Macbook Pro 16 дюймов, золотой",
                          imageName: ["leatherCase", "leatherCase2", "leatherCase3"],
                          price: "7 299,00 руб.",
                          url: "product/HPZR2ZM/A/von-holzhausen-macbook-16-portfolio?fnode=21c233d3c17dc75ee73cee2687b3cfe9f4659e6244e6b9d51bdbeef7d553d2e14a71a34a43b5f55940f3741178adb6077ccda8bfd2a3f7585cbbcb5788005db8eea46c27f788cdcdd8d42f662ea750da5334b3920648ab24f1bdf36b037fcf09988a61bb834f2d1c790708828339efcb"),
                  Product(title: "Iphone 12 Pro",
                          imageName: ["iphone12pro"],
                          price: "79 399,00 руб.",
                          url: "buy-iphone/iphone-14-pro"),
                  Product(title: "Airpods Pro",
                          imageName: ["airpodsPro"],
                          price: "23 569,00 руб.",
                          url: "product/MQD83AM/A/airpods-pro"),
                  Product(title: "Macbook Pro (16-inch, 2021)",
                          imageName: ["macbookPro"],
                          price: "123 799,00 руб.",
                          url: "buy-mac/macbook-pro/16-inch")
  ]
  // swiftlint:enable all
  
  private init() {}
}
