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
  private let bannersLoader: IBannersLoader
  
  init(productsLoader: IProductsLoader, bannersLoader: IBannersLoader) {
    self.productsLoader = productsLoader
    self.bannersLoader = bannersLoader
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
  
  private var banners: [Product] = [] {
  didSet {
      tableView.reloadData()
    }
  }
  
  // MARK: - UIElements
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = .systemBackground
    tableView.separatorStyle = .none
    tableView.registerCell(BannerContainerCell.self)
    tableView.registerHeaderFooterView(CategoryContainerHeader.self)
    tableView.registerCell(ProductCell.self)
    
    if #available(iOS 15.0, *) {
      tableView.sectionHeaderTopPadding = 0
    }
    
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
    
    loadProducts()
    loadBanners()
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
  
  func loadBanners() {
    bannersLoader.loadBanners { [weak self] result in
      guard let self else { return }
      switch result {
      case .success(let banners):
        self.banners = banners
      case .failure(let error):
        print(error)
      }
    }
    
  }
}

// MARK: - UITableViewDataSource
enum MenuSection: Int, CaseIterable {
  case banners
  case products
}

extension MenuScreenVC: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return MenuSection.allCases.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let menuSection = MenuSection(rawValue: section) else { return 0 }
    
    switch menuSection {
    case .banners: return Constants.bannerCount
    case .products: return products.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let menuSection = MenuSection(rawValue: indexPath.section) else { return UITableViewCell() }
    
    switch menuSection {
    case .banners:
      let cell = tableView.dequeueCell(indexPath) as BannerContainerCell
      
      cell.update(banners)
      return cell
      
    case .products:
      let cell = tableView.dequeueCell(indexPath) as ProductCell
      let product = products[indexPath.row]
      cell.update(product)
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = CategoryContainerHeader(reuseIdentifier: CategoryContainerHeader.reuseId)
    
    header.update([
      Category(name: "Пицца"),
      Category(name: "Комбо"),
      Category(name: "Завтраки"),
      Category(name: "Напитки"),
      Category(name: "Десерты"),
      Category(name: "Прочее"),
    ])
    
    return header
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    guard let menuSection = MenuSection(rawValue: section) else { return 0 }
    
    switch menuSection {
    case .banners:
      return 0
    case .products:
      return 60
    } 
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
