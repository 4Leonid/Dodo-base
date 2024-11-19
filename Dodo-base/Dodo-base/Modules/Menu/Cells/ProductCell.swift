//
//  CustomCell.swift
//  DodoPizza
//
//  Created by Леонид Турко on 01.10.2024.
//

import UIKit

final class ProductCell: UITableViewCell {
 
  private let photoImageView = ImageView(type: .product)
  private let nameLabel = Label(type: .name)
  private let descriptionLabel = Label(type: .detail)
  private let priceLabel = Label(type: .price)

  
  
  private let horizontalStackView = StackView(type: .productCell)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public Actions
extension ProductCell {
  func update(_ product: Product) {
    photoImageView.image = UIImage(named: product.image)
    nameLabel.text = product.name
    descriptionLabel.text = product.detail
    priceLabel.text = "от \(product.price) ₽"
  }
}

extension ProductCell {
  func setupViews() {
    selectionStyle = .none
    backgroundColor = .systemBackground
    contentView.addSubview(photoImageView)
    contentView.addSubview(horizontalStackView)
    
    horizontalStackView.addArrangedSubview(nameLabel)
    horizontalStackView.addArrangedSubview(descriptionLabel)
    horizontalStackView.addArrangedSubview(priceLabel)
  }
  
  func setupConstraints() {
    photoImageView.snp.makeConstraints { make in
      make.left.equalTo(contentView).inset(Layout.offset16)
      make.centerY.equalTo(contentView)
      make.top.bottom.greaterThanOrEqualTo(contentView).inset(Layout.offset16)
    }
    
    horizontalStackView.snp.makeConstraints { make in
      make.top.bottom.greaterThanOrEqualTo(contentView).inset(Layout.offset16)
      make.left.equalTo(photoImageView.snp.right).offset(Layout.offset8)
      make.right.equalTo(contentView).inset(Layout.offset16)
    }
  }
}