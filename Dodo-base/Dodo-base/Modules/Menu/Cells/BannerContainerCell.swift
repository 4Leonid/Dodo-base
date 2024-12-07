//
//  BannerContainerCell.swift
//  Dodo-base
//
//  Created by Леонид Турко on 04.11.2024.
//

import UIKit

final class BannerContainerCell: UITableViewCell {
  
  private let nameLabel = Label(type: .bunner, text: "Выгодно и вкусно")
  
  private var banners: [Product] = []
  
  private lazy var collectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 220, height: 100)
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.registerCell(BannerCollectionCell.self)
    collectionView.showsHorizontalScrollIndicator = false
  
    return collectionView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public Methods
extension BannerContainerCell {
  func update(_ banners: [Product]) {
    self.banners = banners
    collectionView.reloadData()
  }
}

// MARK: - UICollectionViewDataSource
extension BannerContainerCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    banners.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueCell(indexPath) as BannerCollectionCell
    let banner = banners[indexPath.item]
    cell.update(banner)
    
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension BannerContainerCell: UICollectionViewDelegate {
  
}

// MARK: - Layout
extension BannerContainerCell {
  func setupViews() {
    contentView.addSubview(nameLabel)
    contentView.addSubview(collectionView)
  }
  
  func setupConstraints() {
    nameLabel.snp.makeConstraints { make in
      make.left.top.equalTo(contentView).inset(8)
    }
    
    collectionView.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom).offset(8)
        make.left.right.bottom.equalTo(contentView).inset(8)
    }
  }
}
