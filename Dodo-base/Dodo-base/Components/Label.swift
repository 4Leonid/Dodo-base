//
//  Label.swift
//  Dodo-base
//
//  Created by Леонид Турко on 29.10.2024.
//

import UIKit

enum LabelType {
  case name
  case description
  case price
}

class Label: UILabel {
  
  init(type: LabelType, text: String = "") {
    super.init(frame: .zero)
    commonInit(type, text)
  }
  
  
  func commonInit(_ type: LabelType, _ text: String = "") {
    switch type {
    case .name:
      self.text = text
      font = .boldSystemFont(ofSize: 20)
    case .description:
      self.text = text
      font = .systemFont(ofSize: 20)
    case .price:
      self.text = text
      font = .boldSystemFont(ofSize:15)
      backgroundColor = .lightGray
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
