//
//  UITableViewCell+reuseId.swift
//  Dodo-base
//
//  Created by Леонид Турко on 03.11.2024.
//

import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
  
  static var reuseId: String {
    String(describing: self)
  }
}
