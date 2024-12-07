//
//  StackView.swift
//  Dodo-base
//
//  Created by Леонид Турко on 30.10.2024.
//

import UIKit

enum StackViewType {
  case productCell
}

class StackView: UIStackView {
  
  init(type: StackViewType) {
    super.init(frame: .zero)
    commonInit(type)
  }

  func commonInit(_ type: StackViewType) {
    switch type {
    case .productCell:
      axis = .vertical
      distribution = .fill
      alignment = .leading
      spacing = Layout.offset6
      
      directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
      isLayoutMarginsRelativeArrangement = true
      backgroundColor = .systemBackground
    }
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
