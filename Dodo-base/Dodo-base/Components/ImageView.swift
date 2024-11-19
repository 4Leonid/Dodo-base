//
//  ImageView.swift
//  Dodo-base
//
//  Created by Леонид Турко on 29.10.2024.
//

import UIKit

enum ImageViewType {
  case product
  case detail
  case bunner
}

class ImageView: UIImageView {
  
  init(type: ImageViewType) {
    super.init(frame: .zero)
    commonInit(type)
  }
  
  func commonInit(_ type: ImageViewType) {
    switch type {
    case .product:
      image = UIImage(named: "bestoganov")
      contentMode = .scaleAspectFit
      heightAnchor.constraint(equalToConstant: 130).isActive = true
      widthAnchor.constraint(equalToConstant: 130).isActive = true
    case .detail:
      image = UIImage(named: "bestroganov")
      contentMode = .scaleAspectFit
      heightAnchor.constraint(equalToConstant: 300).isActive = true
      widthAnchor.constraint(equalToConstant: 300).isActive = true
    case .bunner:
      image = UIImage(named: "bestroganov")
      contentMode = .scaleAspectFit
      heightAnchor.constraint(equalToConstant: 100).isActive = true
      widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
