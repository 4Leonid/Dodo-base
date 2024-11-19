//
//  UICollectionView.swift
//  Dodo-base
//
//  Created by Леонид Турко on 04.11.2024.
//

import UIKit

extension UICollectionView {
  
  func registerCell<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
    register(cellClass, forCellWithReuseIdentifier: cellClass.reuseId)
  }
  
  func dequeueCell<Cell: UICollectionViewCell>(_ indexPath: IndexPath) -> Cell {
    guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.reuseId, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)") }
    return cell
  }
}
