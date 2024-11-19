//
//  CategoryCollectionCell.swift
//  Dodo-base
//
//  Created by Леонид Турко on 16.11.2024.
//

import UIKit

final class CategoryCollectionCell: UICollectionViewCell {
  
  private let nameLabel = Label(type: .name, text: "Пицца")
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func setupViews() {
    contentView.addSubview(nameLabel)
  }
  
  func setupConstraints() {
    nameLabel.snp.makeConstraints { make in
      make.edges.equalTo(contentView).inset(Layout.offset16)
    }
  }
}

extension CategoryCollectionCell {
  func update(_ category: Category) {
    nameLabel.text = category.name
  }
}
