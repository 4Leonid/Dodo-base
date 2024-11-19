//
//  Product.swift
//  DodoPizza
//
//  Created by Леонид Турко on 05.10.2024.
//

import UIKit

struct Product: Decodable {
  let id: Int
  let name: String
  let detail: String
  let image: String
  let price: UInt
  let type: String
}
