//
//  MenuViewController.swift
//  DodoPizza
//
//  Created by Леонид Турко on 01.10.2024.
//

import UIKit

class MenuViewController: UIViewController {
  
  // MARK: - UIElements
  private lazy var tableView = UITableView()
  
  private let productFactory = ProductFactory()
  let collectionCells = ["firstCell", "secondCell"]
  

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    
  }
  
  func setupViews() {
    view.backgroundColor = .black
    
    tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseIdentifier)
    tableView.register(CollectionHeaderView.self, forHeaderFooterViewReuseIdentifier: CollectionHeaderView.identifier)
    tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.reuseIdentifier)
    tableView.rowHeight = ProductCell.rowHeight
    tableView.allowsSelection = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(tableView)
    
    setupConstraints()
    setupDelegate()
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  
  func setupDelegate() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let products = productFactory.getProduct()
    let collectionCells = collectionCells.count
    return section == 0 ? collectionCells : products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    switch indexPath.section {
      case 1:
      guard let pizzaCell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseIdentifier, for: indexPath) as? ProductCell else { return UITableViewCell() }
      let products = productFactory.getProduct()
      let product = products[indexPath.row]
      pizzaCell.configure(with: product)
      cell = pizzaCell
    default:
      guard let collCell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.reuseIdentifier, for: indexPath) as? CollectionTableViewCell else { return UITableViewCell() }
      collCell.configure(with: indexPath.row)
      cell = collCell
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      if section == 1 {
          // Return the collection view header for section 2
          let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CollectionHeaderView.identifier) as! CollectionHeaderView
          return headerView
      }
      return nil
  }
}
