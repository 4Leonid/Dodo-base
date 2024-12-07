//
//  UICollectionView+reuseId.swift
//  Dodo-base
//
//  Created by Леонид Турко on 04.11.2024.
//

import UIKit

extension UICollectionViewCell: Reusable {}

extension Reusable where Self: UICollectionViewCell {
  
  static var reuseId: String {
    String(describing: self)
  }
}
