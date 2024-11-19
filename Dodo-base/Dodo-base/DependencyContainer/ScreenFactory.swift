//
//  ScreenFactory.swift
//  Dodo-base
//
//  Created by Леонид Турко on 14.11.2024.
//

import Foundation

final class ScreenFactory {
  
  weak var di: DependencyContainer!
  
  func makeMenuScreen() -> MenuScreenVC {
    MenuScreenVC(productsLoader: di.productsLoader, bannersLoader: di.bannersLoader)
  }
  
}
