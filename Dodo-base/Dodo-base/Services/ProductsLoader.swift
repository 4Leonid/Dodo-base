//
//  ProductsLoader.swift
//  Dodo-base
//
//  Created by Леонид Турко on 28.10.2024.
//

import Foundation

enum NetworkError: Error {
  case statusCode
}

protocol IProductsLoader {
  func loadProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}

final class ProductsLoader: IProductsLoader {
  
  private let session: URLSession
  private let decoder: JSONDecoder
  
  init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
    self.session = session
    self.decoder = decoder
  }
              
  func loadProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
    
    guard let url = URL(string: "http:localhost:3001/products") else { return }
    
    let request = URLRequest(url: url)
    
    session.dataTask(with: request) { data, response, error in
      if error != nil {
        completion(.failure(NetworkError.statusCode))
      }
      
      guard let data else { return }
      
      do {
        let products = try self.decoder.decode([Product].self, from: data)
        
        DispatchQueue.main.async {
          completion(.success(products))
        }
      } catch {
        print(error)
      }
    }.resume()
  }
}
