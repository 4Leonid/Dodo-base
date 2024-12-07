//
//  BannerCollectionCell.swift
//  Dodo-base
//
//  Created by Леонид Турко on 04.11.2024.
//

import UIKit

final class BannerCollectionCell: UICollectionViewCell {
  
  private let photoImageView = ImageView(type: .bunner)
  private let nameLabel = Label(type: .name, text: "Пицца")
  private let priceLabel = Label(type: .price, text: "от 500 ₽")
  
  private let verticalStackView = StackView(type: .productCell)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public Methods
extension BannerCollectionCell {
  func update(_ banner: Product) {
    photoImageView.image = UIImage(named: banner.image)
    nameLabel.text = banner.name
    priceLabel.text = "от \(banner.price) ₽"
  }
}

// MARK: - Layout
extension BannerCollectionCell {
  func setupViews() {
    contentView.addSubview(photoImageView)
    contentView.addSubview(verticalStackView)
    verticalStackView.addArrangedSubview(nameLabel)
    verticalStackView.addArrangedSubview(priceLabel)
  }
  
  func setupConstraints() {
    photoImageView.snp.makeConstraints { make in
      make.left.equalTo(contentView).offset(8)
      make.centerY.equalTo(contentView)
    }
    
    verticalStackView.snp.makeConstraints { make in
      make.top.right.bottom.equalTo(contentView).inset(8)
      make.left.equalTo(photoImageView.snp.right).offset(8)
    }
  }
}
