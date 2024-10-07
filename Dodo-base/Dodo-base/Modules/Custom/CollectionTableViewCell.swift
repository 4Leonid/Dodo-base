//
//  CollectionTableViewCell.swift
//  DodoPizza
//
//  Created by Леонид Турко on 05.10.2024.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
  static let reuseIdentifier = String(describing: CollectionTableViewCell.self)
    
    // Sample data for collection view
    var data: [String] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Create the collection view layout (horizontal scrolling)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 100)
        layout.minimumLineSpacing = 10
        
        // Initialize the collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
      collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CollectionTableViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        
        // Add the collection view to the content view of the cell
        contentView.addSubview(collectionView)
        
        // Set constraints for the collection view to fill the cell
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure Method
    func configure(with row: Int) {
        // Configure the data based on the row (you can customize the data per row)
        data = (1...10).map { "Item \($0)" } // Sample data
        collectionView.reloadData()
    }

    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionTableViewCell.reuseIdentifier, for: indexPath)
        
        // Configure the collection view cell
        cell.contentView.backgroundColor = .blue
        
        // Optional: Add label to the cell
        let label = UILabel(frame: cell.contentView.bounds)
        label.text = data[indexPath.item]
        label.textAlignment = .center
        label.textColor = .white
        cell.contentView.addSubview(label)
        
        return cell
    }
}

final class CollectionViewCell: UICollectionViewCell {
  
  private let imageView = UIImageView()
  static let reuseIdentifier = String(describing: CollectionViewCell.self)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CollectionViewCell {
  func setupViews() {
    addSubview(imageView)
    
    setupConstraints()
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      ])
  }
  
  func configure(with image: UIImage) {
    imageView.image = image
  }
}
