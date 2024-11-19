//
//  Label.swift
//  Dodo-base
//
//  Created by Леонид Турко on 29.10.2024.
//

import UIKit

enum LabelType {
  case name
  case detail
  case price
  case bunner
}

class Label: InsetLabel {
  
  init(type: LabelType, text: String = "") {
    super.init(frame: .zero)
    commonInit(type, text)
  }
  
  
  func commonInit(_ type: LabelType, _ text: String = "") {
    switch type {
    case .name:
      self.text = text
      font = .boldSystemFont(ofSize: 14)
    case .detail:
      self.text = text
      font = .systemFont(ofSize: 12)
      numberOfLines = 0
      textColor = .lightGray
    case .price:
      self.text = text
      font = .boldSystemFont(ofSize: 15)
      backgroundColor = .lightGray.withAlphaComponent(0.5)
      layer.cornerRadius = 16
      clipsToBounds = true
      contentInset = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
    case .bunner:
      self.text = text
      font = .boldSystemFont(ofSize: 22)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
