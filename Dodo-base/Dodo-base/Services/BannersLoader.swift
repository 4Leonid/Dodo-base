//
//  BannersLoader.swift
//  Dodo-base
//
//  Created by Леонид Турко on 18.11.2024.
//

import Foundation

protocol IBannersLoader {
  func loadBanners(completion: @escaping (Result<[Product], Error>) -> Void)
}

final class BannersLoader: IBannersLoader {
  
  private let session: URLSession
  private let decoder: JSONDecoder
  
  init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
    self.session = session
    self.decoder = decoder
  }
  
  func loadBanners(completion: @escaping (Result<[Product], Error>) -> Void) {
    
    guard let url = URL(string: "http:localhost:3001/banners") else { return }
    
    let request = URLRequest(url: url)
    
    session.dataTask(with: request) { data, response, error in
      
      if error != nil {
        completion(.failure(NetworkError.statusCode))
      }
      
      guard let data else { return }
      
      do {
        let banners = try self.decoder.decode([Product].self, from: data)
        
        DispatchQueue.main.async {
          completion(.success(banners))
        }
        
      } catch {
        print(error)
      }
    }.resume()
  }
}
