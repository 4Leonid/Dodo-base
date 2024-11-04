//
//  Product.swift
//  DodoPizza
//
//  Created by Леонид Турко on 05.10.2024.
//

import UIKit

struct Product: Decodable {
  let name: String
  let description: String
  let image: String
  let price: UInt
}
