//
//  CustomHeaderView.swift
//  DodoPizza
//
//  Created by Леонид Турко on 06.10.2024.
//

import UIKit

class CollectionHeaderView: UITableViewHeaderFooterView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = String(describing: CollectionHeaderView.self)
    
    var collectionView: UICollectionView!

    let items = ["Пиццы", "Мини-пиццы", "Комбо", "Закуски", "Завтрак", "Коктейли", "Кофе", "Напитки", "Десерты", "Любят дети", "Соусы", "Другие товары"]

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        // Create the layout for the collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        
        // Initialize the collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.backgroundColor = .clear

        // Add the collection view to the header view
        contentView.addSubview(collectionView)
        
        // Set up auto layout for the collection view
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

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
      cell.backgroundColor = .black
        
        // Add a label to the collection view cell
        let label = UILabel(frame: cell.contentView.bounds)
        label.text = items[indexPath.row]
        label.textAlignment = .center
        label.textColor = .white
        
        // Clear previous content and add the label
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.addSubview(label)
        
        return cell
    }
}

