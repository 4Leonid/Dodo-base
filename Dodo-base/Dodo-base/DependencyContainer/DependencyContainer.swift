//
//  DependencyContainer.swift
//  Dodo-base
//
//  Created by Леонид Турко on 14.11.2024.
//

import Foundation

final class DependencyContainer {
  
  let session: URLSession
  let decoder: JSONDecoder
  let productsLoader: ProductsLoader
  let bannersLoader: BannersLoader
  
  let screenFactory: ScreenFactory
  
  init() {
    session = URLSession.shared
    decoder = JSONDecoder()
    productsLoader = ProductsLoader(session: session, decoder: decoder)
    bannersLoader = BannersLoader(session: session, decoder: decoder)
    
    screenFactory = ScreenFactory()
    screenFactory.di = self // спросить у Артура
  }
}


