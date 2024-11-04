//
//  UIView+Extensions.swift
//  DodoPizza
//
//  Created by Леонид Турко on 01.10.2024.
//

import UIKit

extension UIView {
  func addSubviews(_ subviews: [UIView]) {
    subviews.forEach { addSubview($0) }
  }
  
  @discardableResult func edgesToSuperview() -> Self {
    guard let superview = superview else {
      fatalError("View не в иерархии!")
    }
    
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: superview.topAnchor),
      leadingAnchor.constraint(equalTo: superview.leadingAnchor),
      trailingAnchor.constraint(equalTo: superview.trailingAnchor),
      bottomAnchor.constraint(equalTo: superview.bottomAnchor)
    ])
    return self
  }
  
  @discardableResult func edgesToSuperview(_ top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat) -> Self {
    guard let superview = superview else {
      fatalError("View не в иерархии!")
    }
    
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: superview.topAnchor, constant: top),
      leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading),
      trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing),
      bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom)
    ])
    return self
  }
}
