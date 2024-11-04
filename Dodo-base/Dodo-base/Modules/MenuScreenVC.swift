//
//  MenuViewController.swift
//  DodoPizza
//
//  Created by Леонид Турко on 01.10.2024.
//

import UIKit
import SnapKit

class MenuScreenVC: UIViewController {
  
  private let productsLoader: IProductsLoader
  
  init(productsLoader: IProductsLoader) {
    self.productsLoader = productsLoader
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private var products: [Product] = [] {
  didSet {
      tableView.reloadData()
    }
  }
  
  // MARK: - UIElements
  private lazy var tableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = .green
    tableView.registerCell(ProductCell.self)
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
    
    loadProducts()
  }
}

// MARK: - Actions
extension MenuScreenVC {
  func loadProducts() {
    productsLoader.loadProducts { [weak self] result in
      guard let self else { return }
      switch result {
      case .success(let products):
        self.products = products
      case .failure(let error):
        print(error)
      }
    }
  }
}

// MARK: - UITableViewDataSource
extension MenuScreenVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueCell(indexPath) as ProductCell
    
    let product = products[indexPath.row]
    
    cell.update(product)
    
    return cell
  }
}

// MARK: - UITableViewDelegate
extension MenuScreenVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}

// MARK: - Layout
extension MenuScreenVC {
  func setupViews() {
    view.addSubview(tableView)
  }
  
  func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(view)
    }
  }
}
