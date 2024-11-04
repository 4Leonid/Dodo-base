//
//  MenuConfigurator.swift
//  Dodo-base
//
//  Created by Леонид Турко on 03.11.2024.
//

import Foundation

final class MenuConfigurator {
  func configure() -> MenuScreenVC {
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    let productsLoader = ProductsLoader(session: session, decoder: decoder)
    
    let menuVC = MenuScreenVC(productsLoader: productsLoader)
    
    return menuVC
  }
}
