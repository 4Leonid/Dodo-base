//
//  UITableViewCell+dequeueCell.swift
//  Dodo-base
//
//  Created by Леонид Турко on 03.11.2024.
//

import UIKit

extension UITableView {
  
  func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
    register(cellClass, forCellReuseIdentifier: cellClass.reuseId)
  }
  
  func registerHeaderFooterView<View: UITableViewHeaderFooterView>(_ viewClass: View.Type) {
    register(viewClass, forHeaderFooterViewReuseIdentifier: viewClass.reuseId)
  }
  
  func dequeueCell<Cell: UITableViewCell>(_ indexPath: IndexPath) -> Cell {
    guard let cell = dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)") }
    return cell
  }
}
