//
//  CategoryContainerCell.swift
//  Dodo-base
//
//  Created by Леонид Турко on 16.11.2024.
//

import UIKit

struct Category {
  let name: String
}

final class CategoryContainerHeader: UITableViewHeaderFooterView {
  
  var categories: [Category] = []
  
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    layout.scrollDirection = .horizontal
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    collectionView.registerCell(CategoryCollectionCell.self)
    collectionView.dataSource = self
    collectionView.delegate = self
    return collectionView
  }()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setupViews()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Public Methods
extension CategoryContainerHeader {
  func update(_ categories: [Category]) {
    self.categories = categories
  }
}
 
// MARK: - UICollectionViewDataSource
extension CategoryContainerHeader: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    categories.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueCell(indexPath) as CategoryCollectionCell
    
    let category = categories[indexPath.item]
    cell.update(category)
    
    return cell
  }
  
  
}

// MARK: - UICollectionViewDelegate
extension CategoryContainerHeader: UICollectionViewDelegate {
  
}

// MARK: - Layout
extension CategoryContainerHeader {
  func setupViews() {
    contentView.addSubview(collectionView)
  }
  
  func setupConstraints() {
    collectionView.snp.makeConstraints { make in
      make.edges.equalTo(contentView).inset(Layout.offset6)
    }
  }
}
